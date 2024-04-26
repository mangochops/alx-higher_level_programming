#!/bin/bash

# Check if URL argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Get the URL from command line argument
url="$1"

# Send an OPTIONS request to the URL using curl to get supported HTTP methods
methods=$(curl -s -I -X OPTIONS "$url" | grep "Allow:" | awk '{print $2}')

# Display the supported HTTP methods
echo "$methods"
