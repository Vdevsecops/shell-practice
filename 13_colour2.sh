#!/bin/bash

R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Please run this script with root privelage"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installation of $2 is $R Failure $N"
    else
        echo "Installation of $2 is $G Success $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ];then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "MySQL Package Is Already Installed --- $Y Step is Skipping $N"
fi

dnf list installed nginx
    if [ $? -ne 0 ]; then
        dnf install nginx -y
        VALIDATE $? "nginx"
    else
        echo "Nginx Package is Already Installed --- $Y Step is Skipping $N"
    fi

dnf list installed python3
    if [ $? -ne 0 ];then
        dnf install python3 -y
        VALIDATE $? "Python3"
    else 
        echo "Python3 Package Is Already Installed --- $Y Step is Skipping $N"
    fi
