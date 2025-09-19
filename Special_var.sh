#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "Script name: $0"
echo "Current directory: $PWD"
echo "Who is running this: $USER"
echo "Home directory of user: $HOME"
echo "PID of this script: $$"
sleep 50 &
echo "PID of the last command in background is: $!"
#arguments
name=$1
age=$2
village=$3
occupation=$4

echo "My Details
Name: $1 ,Age= $2, Village= $3, Occupation= $4 "