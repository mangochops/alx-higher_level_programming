#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <URL> <JSON_FILE>"
    exit 1
fi

url="$1"
json_file="$2"

# Check if the JSON file is valid
if ! jq . "$json_file" >/dev/null 2>&1; then
    echo "Not a valid JSON"
    exit 1
fi

# Send POST request and display response body
response=$(curl -s -X POST -H "Content-Type: application/json" -d @"$json_file" "$url")
echo "$response"
