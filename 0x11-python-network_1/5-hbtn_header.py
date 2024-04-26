import requests
import sys

url = sys.argv[1]

response = requests.get(url)
x_request_id = response.headers.get('X-Request-Id')

if x_request_id:
    print(x_request_id)
else:
    print("X-Request-Id header not found in the response.")
