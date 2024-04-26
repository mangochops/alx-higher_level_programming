#!/bin/bash

# Check if URL argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Get the URL from command line argument
url="$1"

# Send a GET request to the URL using curl and display the body if status code is 200
curl_output=$(curl -s -o /dev/null -w "%{http_code}" "$url")
if [ "$curl_output" -eq 200 ]; then
    curl -s "$url"
else
    echo "Error: Non-200 status code received: $curl_output"
fi
