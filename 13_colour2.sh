#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Please run this script with root privelage"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Installation of $2 is Failure"
    else
        echo "Installation of $2 is Success"
    fi
}

dnf install mysql -y
VALIDATE $? "MySQL"