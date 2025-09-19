#!/bin/bash

#read (get input from user)
# '-s' which hide the user's input. usecase <password input>

echo "Please enter your password"
echo "Password : " read -s password # password need to enter by user
echo "You'r Password is $password"