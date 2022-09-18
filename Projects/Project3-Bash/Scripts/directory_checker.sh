#! /bin/bash

echo "Directory name to check: "

read -r directory

if [ -d "$directory" ]; then
    echo "$directory exists"
else
    echo "$directory does not exist"
fi
