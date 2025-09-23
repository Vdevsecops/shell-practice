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

dnf list installed mysql
if [ $? -ne 0 ];then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "MySQL Package Is Already Installed"
fi

dnf list installed nginx
    if [ $? -ne 0 ]; then
        dnf install nginx -y
        VALIDATE $? "nginx"
    else
        echo "Nginx Package is Already Installed"
    fi

dnf list installed python3
    if [ $? -ne 0 ];then
        dnf install python3 -y
        VALIDATE $? "Python3"
    else 
        echo "Python3 Package Is Already Installed"
    fi
