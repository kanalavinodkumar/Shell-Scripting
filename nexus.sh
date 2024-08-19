#!/bin/bash

#check root user
user=$(id -u)


if [ $user -ne 0 ]; then
	echo "you need to be root for execution"
	exit 1
fi

validate (){
	if [ $? -ne 0 ]; then
		echo "$1 : Failure"
		exit 1
	else
		echo "$1 : Success"
	fi
}


apt-get update -y
validate "apt-get update"


# Install necessary dependencies
apt-get install -y ca-certificates curl

# Create directory for Docker GPG key
install -m 0755 -d /etc/apt/keyrings

# Download Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Ensure proper permissions for the key
chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package manager repositories
apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
validate "Docker Installation"

chmod 666 /var/run/docker.sock

docker run -d --name nexus -p 8081:8081 sonatype/nexus3
validate "Nexus Installation"
