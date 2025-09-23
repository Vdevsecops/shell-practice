#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo" Error:: Please run this script with root priveleage"
    exit 1 # failure is other then 0 
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error :: Installing mysql is failure"
    exit 1
else    
    echo "Installation MySQL is Success"
fi