# Write a shell script to fetch the data from rest api and take out the required fileds

#!/bin/bash

# API endpoint
API_URL="https://jsonplaceholder.typicode.com/posts"

# Fetch data from the API
response=$(curl -s "$API_URL")

# Check if the response is empty
if [ -z "$response" ]; then
    echo "No data received from the API."
    exit 1
fi

# Extract required fields using jq
# Change 'title' and 'body' to the fields you want to extract
echo "$response" | jq '.[] | {title: .title, body: .body}'

# Optional: Save output to a file
# echo "$response" | jq '.[] | {title: .title, body: .body}' > output.json

echo "Data fetched and processed successfully."




#Output
{
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit... (content truncated)"
}
{
  "title": "qui est esse",
  "body": "est rerum tempore vitae\nsequi sint... (content truncated)"
}
{
  "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
  "body": "et iusto sed quo iure\nvoluptatem omnis... (content truncated)"
}
...

