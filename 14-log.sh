#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Log_Folder="/var/log/Shell-Scripting"
Script_name=$(echo $0 | cut -d "." -f1)
Log_File="$Log_Folder/$Script_name.log"

mkdir -p $Log_Folder
echo "Script Started exicuting on $(date)"
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

dnf list installed mysql &>>$Log_File
if [ $? -ne 0 ];then
    dnf install mysql -y &>>$Log_File 
    VALIDATE $? "MySQL"
else
    echo -e "MySQL Package Is Already Installed --- $Y Skipping the Step $N"
fi

dnf list installed nginx &>>$Log_File
    if [ $? -ne 0 ]; then
        dnf install nginx -y &>>$Log_File
        VALIDATE $? "nginx"
    else
        echo -e "Nginx Package is Already Installed --- $Y Skipping the Step $N"
    fi

dnf list installed python3 &>>$Log_File
    if [ $? -ne 0 ];then
        dnf install python3 -y &>>$Log_File
        VALIDATE $? "Python3"
    else 
        echo -e "Python3 Package Is Already Installed --- $Y Skipping the Step $N"
    fi
