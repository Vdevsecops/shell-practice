#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "Please run Script With Root Privelage"
    exit 1
fi

VALIDATE(){
    if [$1 -ne 0];then
        echo -e "installation of $2 is $R Failure $N"
        exit 1
    else
        echo -e "Installation of $2 is $G SUCCESS $N"
    fi
}

dnf list installed mysql
if [$? -ne 0];then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo "MySQl Package is already Installed $Y Skipping $N"    
fi
