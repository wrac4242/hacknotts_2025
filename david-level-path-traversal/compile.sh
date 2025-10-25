#! /bin/bash

# check if it exists first
if [ -f "lookup-project/lookup" ]; then
    rm lookup-project/lookup
fi

#compile the project
gcc -o lookup-project/lookup lookup-project/lookup.c