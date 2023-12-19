#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

file="/etc/passwd"

if [ -f "${file}" ]; 
then
    echo -e "$RFile doesn't exist.$N"
fi

while IFS=":" read -r username password user_id group_id user_id_info home_directory command_shell
do
    echo "username: $username"
    echo "password: $password"
    echo "user_id: $user_id"
    echo "group_id: $group_id"
    echo "user_id_info: $user_id_info"
    echo "group_id_info: $group_id_info"
    echo "home_directory: $home_directory"
    echo "command/shell: $command_shell"
done < $file


