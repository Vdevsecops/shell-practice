#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Log_Folder="/var/log/Shell-Scripting"
# Script_name=$(echo $0 | cut -d "." -f1)
# Log_File="$Log_Folder/$Script_name.log"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
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

dnf list installed mysql &>>$LOGS_FOLDER
if [ $? -ne 0 ];then
    dnf install mysql -y &>>$$LOGS_FOLDER
    VALIDATE $? "MySQL"
else
    echo -e "MySQL Package Is Already Installed $Y Skipping the Step $N"
fi

dnf list installed nginx &>>$LOGS_FOLDER
    if [ $? -ne 0 ]; then
        dnf install nginx -y &>>$LOGS_FOLDER
        VALIDATE $? "nginx"
    else
        echo -e "Nginx Package is Already Installed $Y Skipping the Step $N"
    fi

dnf list installed python3 &>>$LOGS_FOLDER
    if [ $? -ne 0 ];then
        dnf install python3 -y &>>$LOGS_FOLDER
        VALIDATE $? "Python3"
    else 
        echo -e "Python3 Package Is Already Installed $Y Skipping the Step $N"
    fi
