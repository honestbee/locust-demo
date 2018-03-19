package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
)

type pageData struct {
	Message string
	Title   string
}

func main() {
	http.HandleFunc("/index", handleIndex)
	log.Printf("Starting")
	log.Fatal(http.ListenAndServe(":8000", nil))
}

func handleIndex(w http.ResponseWriter, r *http.Request) {
	log.Printf("Incoming request")
	data := &pageData{Message: "Hello Locust", Title: "Locust Demo Project"}
	if err := render(w, "index", data); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func render(w http.ResponseWriter, name string, data interface{}) error {
	tpl, err := template.ParseFiles(fmt.Sprintf("templates/%s.html", name))
	if err != nil {
		return err
	}
	return tpl.Execute(w, data)
}
