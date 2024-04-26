#!/bin/bash

# Check if URL argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Get the URL from command line argument
url="$1"

# Send a POST request to the URL with variables email and subject using curl
curl -s -X POST -d "email=test@gmail.com&subject=I will always be here for PLD" "$url"
