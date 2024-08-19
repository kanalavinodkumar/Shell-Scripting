#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
#check root user
user=$(id -u)


if [ $user -ne 0 ]; then
	echo "you need to be root for execution"
	exit 1
fi

validate (){
	if [ $1 -ne 0 ]; then
		echo -e "$2 ... $R FAILURE $N"
		exit 1
	else
		echo -e "$2 ... $G SUCCESS $N"
	fi
}


apt-get update -y &>>$LOGFILE
validate $? "apt-get update"
echo $LOGFILE


# Install necessary dependencies
apt-get install -y ca-certificates curl &>>$LOGFILE

# Create directory for Docker GPG key
install -m 0755 -d /etc/apt/keyrings &>>$LOGFILE

# Download Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc &>>$LOGFILE

# Ensure proper permissions for the key
chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
tee /etc/apt/sources.list.d/docker.list > /dev/null &>>$LOGFILE

# Update package manager repositories
apt-get update &>>$LOGFILE

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin &>>$LOGFILE
validate $? "Docker Installation"

chmod 666 /var/run/docker.sock

docker run -d --name nexus -p 8081:8081 sonatype/nexus3 &>>$LOGFILE
validate $? "Nexus Installation"
