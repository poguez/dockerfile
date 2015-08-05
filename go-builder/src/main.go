package main

import(
  "fmt"
  "net/http"
)

func handler( w http.ResponseWriter, r *http.Request ) {
  fmt.Fprintf( w, "Hi %s", "there" );
}

func main() {
  http.HandleFunc( "/", handler );
  http.ListenAndServe( ":3333", nil );
}
