!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Log_Folder="/var/log/Shell-Scripting"
Script_name=$(echo $0 | cut -d "." -f1)
Log_File="$Log_Folder/$Script_name.log"
mkdir -p $LOGS_FOLDER
echo "Script Started exicuting on $(date)"


if [ $userid -ne 0 ]; then
    echo "Please run this script with root privelage"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installation of $2 is $R Failure $N"
        exit 1
    else
        echo -e "Installation of $2 is $G Success $N"
    fi
}

dnf list installed mysql &>>$Log_File
    if [ $? -ne 0 ];then
        dnf install mysql -y &>>$Log_File
        VALIDATE $? "MySQL"
    else
        echo -e "MySQL Package Is Already Installed $Y Skipping the Step $N"
    fi

dnf list installed nginx &>>$Log_File
    if [ $? -ne 0 ]; then
        dnf install nginx -y &>>$Log_File
        VALIDATE $? "nginx"
    else
        echo -e "Nginx Package is Already Installed $Y Skipping the Step $N"
    fi

dnf list installed python3 &>>$Log_File
    if [ $? -ne 0 ];then
        dnf install python3 -y &>>$Log_File
        VALIDATE $? "Python3"
    else 
        echo -e "Python3 Package Is Already Installed $Y Skipping the Step $N"
    fi

# USERID=$(id -u)
# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"

# LOGS_FOLDER="/var/log/shell-script"
# SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
# LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

# mkdir -p $LOGS_FOLDER
# echo "Script started executed at: $(date)" | tee -a $LOG_FILE

# if [ $USERID -ne 0 ]; then
#     echo "ERROR:: Please run this script with root privelege"
#     exit 1 # failure is other than 0
# fi

# VALIDATE(){ # functions receive inputs through args just like shell script args
#     if [ $1 -ne 0 ]; then
#         echo -e "Installing $2 ... $R FAILURE $N" | tee -a $LOG_FILE
#         exit 1
#     else
#         echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE
#     fi
# }

# dnf list installed mysql &>>$LOG_FILE
# # Install if it is not found
# if [ $? -ne 0 ]; then
#     dnf install mysql -y &>>$LOG_FILE
#     VALIDATE $? "MySQL"
# else
#     echo -e "MySQL already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
# fi

# dnf list installed nginx &>>$LOG_FILE
# if [ $? -ne 0 ]; then
#     dnf install nginx -y &>>$LOG_FILE
#     VALIDATE $? "Nginx"
# else
#     echo -e "Nginx already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
# fi

# dnf list installed python3 &>>$LOG_FILE
# if [ $? -ne 0 ]; then
#     dnf install python3 -y &>>$LOG_FILE
#     VALIDATE $? "python3"
# else
#     echo -e "Python3 already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
# fi
