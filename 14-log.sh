#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell_log"
LOG_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$LOG_NAME.log"
mkdir -p $LOG_FOLDER

echo "Script Started Executed on $(date)" &>>$LOG_FILE
if [ $USERID -ne 0 ]; then
    echo "Please run Script With Root Privelage"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];then
        echo -e "installation of $2 is $R Failure $N"
        exit 1
    else
        echo -e "Installation of $2 is $G SUCCESS $N"
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"
else 
    echo -e "MySQl Package is already Installed $Y Skipping $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "Nginx Package is already installed $Y Skipping $N"  | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "python3 Package is already installed $Y Skipping $N" | tee -a $LOG_FILE
fi