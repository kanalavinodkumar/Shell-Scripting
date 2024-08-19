#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "$(id -un) is not Root user"
else
	echo "$(id -un)is Root user"
fi