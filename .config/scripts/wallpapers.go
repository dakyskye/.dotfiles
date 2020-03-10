package main

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"math/rand"
	"os"
	"os/exec"
	"path"
	"time"
)

type recent struct {
	File    []File `json:"file,omitempty"`
	Current string `json:"current,omitempty"`
}

type File struct {
	Name string    `json:"name"`
	When time.Time `json:"when"`
}

func main() {
	wallpapersPath := path.Join(os.Getenv("HOME"), "Images", "wallpapers")
	recentsDirPath := path.Join(os.Getenv("HOME"), ".config", ".wallpapers")
	recentsFilePath := path.Join(recentsDirPath, "recents.json")

	err := os.MkdirAll(recentsDirPath, 0744)
	if err != nil {
		log.Fatal(err)
	}

	var recentsFile *os.File

	existed := true

	if _, err = os.Stat(recentsFilePath); os.IsNotExist(err) {
		recentsFile, err = os.Create(recentsFilePath)
		if err != nil {
			log.Fatal(err)
		}
		recentsFile.Write([]byte("{}"))
		recentsFile.Close()
		existed = false
	}

	recents := &recent{}

	recentsFile, err = os.OpenFile(recentsFilePath, os.O_RDWR, os.ModePerm)
	if err != nil {
		log.Fatal(err)
	}

	recentsFileAsBytes, _ := ioutil.ReadAll(recentsFile)

	recentsFile.Close()

	if existed {
		err = json.Unmarshal(recentsFileAsBytes, &recents)
		if err != nil {
			log.Fatal(err)
		}
	}

	wallpapers := []string{}

	files, err := ioutil.ReadDir(wallpapersPath)
	if err != nil {
		log.Fatal(err)
	}

	for _, file := range files {
		if file.IsDir() {
			continue
		}

		wallpapers = append(wallpapers, file.Name())
	}

	if len(wallpapers) == 0 {
		log.Fatal("no wallpaper found at " + wallpapersPath)
	}

	rand.Seed(time.Now().Unix())

	recsCount := make(map[string]int)

	chosen := ""

	for {
		chosen = wallpapers[rand.Intn(len(wallpapers))]
		for index, recent := range recents.File {
			if count, ok := recsCount[recent.Name]; ok {
				if count >= 10 {
					recents.Current = chosen
					recents.File[index].When = time.Now()
					goto final
				}
			}
			if chosen == recent.Name {
				if time.Since(recent.When) >= time.Hour*24*7 {
					recents.Current = chosen
					recents.File[index].When = time.Now()
					goto final
				}
				if _, ok := recsCount[chosen]; ok {
					recsCount[chosen] += 1
					goto redo
				} else {
					recsCount[chosen] = 1
					goto redo
				}
			}
			goto choose
		}
	choose:
		recents.File = append(recents.File, File{Name: chosen, When: time.Now()})
		recents.Current = chosen
	final:
		break
	redo:
		continue
	}

	err = exec.Command("feh", "--bg-scale", path.Join(wallpapersPath, chosen)).Run()
	if err != nil {
		log.Fatal(err)
	}

	recentsFileAsBytes, err = json.Marshal(recents)
	if err != nil {
		log.Fatal(err)
	}
	err = ioutil.WriteFile(recentsFilePath, recentsFileAsBytes, 0744)
	if err != nil {
		log.Fatal(err)
	}
}
