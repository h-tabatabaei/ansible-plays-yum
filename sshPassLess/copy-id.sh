#!/bin/bash

input="./servers"
passlist="./passFile"

while IFS= read -r line; do
    echo $line
    nc -z -v -w5 $line 22  &>/dev/null 
    if [ "$?" -eq "0" ]; then
       while IFS= read -r password; do
#           echo $password
           sshpass -p $password ssh-copy-id -i ssh-key/id_ecdsa.pub -o StrictHostKeyChecking=no root@$line
           if [ "$?" -eq "0" ]; then
               break
           fi
       done < "$passlist"
    else
       echo "can't connect to $line" >> failed-list
    fi
done < "$input"
