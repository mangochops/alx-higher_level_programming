#!/bin/bash

# Check if URL argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Get the URL from command line argument
url="$1"

# Send a request to the URL using curl and get the size of the body in bytes
body_size=$(curl -sI "$url" | grep -i content-length | awk '{print $2}' | tr -d '\r')

# Display the size of the body in bytes
echo "$body_size"
