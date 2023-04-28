package main

import (
	"fmt"
	"net/http"
)

func main() {

	// Handle HTTP requests to "/" and serve the web resources inside the application folder ( index.html / images and so on)
	http.Handle("/", http.FileServer(http.Dir("application")))
	//Error Handling
	webappListener := http.ListenAndServe(":80", nil)
	if webappListener != nil {
		fmt.Printf("Unable to bind port  %v\n", webappListener)
	} else {
		fmt.Println("Application is listening on port 80")
	}
}
