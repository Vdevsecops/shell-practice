#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Please run the script with root priveleage"
    exit 1
fi

VALIDATE(){ # function receives the inputs from args like shell script args
    if [ $1 -ne 0 ]; then
        echo  "Error :: installation of $2 is failure"
        exit 1
    else
        echo "Installation $2 is Success"

    fi
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install python3 -y
VALIDATE $? "python3"

dnf install nginx -y
VALIDATE $? "Nginx"

