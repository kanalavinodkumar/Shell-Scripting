#!/bin/bash

#read values in runtime

echo -n "Hey Vinod...! what's your USERNAME : "
read username

echo -n "PASSWORD : "
read -s password

echo
echo "#####################"
echo "USERNAME : ${username}"
echo "PASSWORD : ${password}"
echo "#####################"