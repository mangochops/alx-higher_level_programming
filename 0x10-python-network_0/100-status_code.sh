
#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

url="$1"

status=$(curl -s -o /dev/null -w "%{http_code}" "$url")

echo "$status"
