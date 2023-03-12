package main

import (
	"fmt"

	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

func init() {
	zerolog.TimeFieldFormat = ""
}

// Main function for the action
func Main(obj map[string]interface{}) map[string]interface{} {
	name, ok := obj["name"].(string)
	if !ok {
		name = "world"
	}
	fmt.Println("Hello, " + name + "!")
	log.Debug().Str("name", name).Msg("Hello")
	msg := make(map[string]interface{})
	msg["body"] = "Hello, " + name + "!"
	msg["statusCode"] = 200
	msg["headers"] = map[string]string{"Content-Type": "text/plain"}
	return msg
}
