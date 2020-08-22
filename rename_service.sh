#!/bin/bash


find_replace_in_file() {
    FROM="$1"
    TO="$2"
    FILE_NAME=$3
    FILE_CONTENT=$(<./$FILE_NAME)
    echo "$FILE_CONTENT" | sed "s/$FROM/$TO/g" > $FILE_NAME
}

find_replace_in_file $1 $2 ".env"
find_replace_in_file $1 $2 "Makefile"
find_replace_in_file $1 $2 "docker-compose.yml"
find_replace_in_file "PyBackendBoilerplate Microservice Boilerplate" $2 "src/openapi/openapi.yaml"