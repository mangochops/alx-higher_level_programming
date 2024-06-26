import requests
import sys

repo_name = sys.argv[1]
owner_name = sys.argv[2]
url = f'https://api.github.com/repos/{owner_name}/{repo_name}/commits'
response = requests.get(url)

if response.status_code == 200:
    commits = response.json()
    for commit in commits[:10]:
        sha = commit['sha']
        author_name = commit['commit']['author']['name']
        print(f"{sha}: {author_name}")
else:
    print("Error fetching commits:", response.status_code)
