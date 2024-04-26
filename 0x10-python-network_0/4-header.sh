#!/bin/bash

# Check if URL argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Get the URL from command line argument
url="$1"

# Send a GET request to the URL with header variable X-School-User-Id set to 98 using curl
curl -s -H "X-School-User-Id: 98" "$url"
