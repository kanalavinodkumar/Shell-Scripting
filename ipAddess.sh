#Write a shell script to extract the ip addresss from a file and the count of similar ipadress
#!/bin/bash

# Check if a file was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File not found!"
    exit 1
fi

# Extract IP addresses from the file
# The regex used to match IPv4 addresses is: [0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}
ip_addresses=$(grep -oE '[0-9]{1,3}(\.[0-9]{1,3}){3}' "$1")

# Check if any IP addresses were found
if [ -z "$ip_addresses" ]; then
    echo "No IP addresses found in the file."
    exit 0
fi

# Display each unique IP address and its count
echo "$ip_addresses" | sort | uniq -c | sort -nr



---

Assume log.txt contains:
192.168.0.1 - - [23/Sep/2024:15:34:45 +0000] "GET /index.html HTTP/1.1" 200 2326
172.16.0.2 - - [23/Sep/2024:15:35:10 +0000] "GET /about.html HTTP/1.1" 200 1234
192.168.0.1 - - [23/Sep/2024:15:35:32 +0000] "POST /login HTTP/1.1" 200 454
172.16.0.3 - - [23/Sep/2024:15:36:01 +0000] "GET /home HTTP/1.1" 200 789
172.16.0.2 - - [23/Sep/2024:15:36:45 +0000] "GET /contact HTTP/1.1" 200 456


Output:
2 192.168.0.1
2 172.16.0.2
1 172.16.0.3
