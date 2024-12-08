#!/bin/bash

# User management script

ACTION=$1
USERNAME=$2
PASSWORD=$3

case $ACTION in
    create)
        if id "$USERNAME" &>/dev/null; then
            echo "User $USERNAME already exists."
        else
            useradd "$USERNAME"
            echo "$USERNAME:$PASSWORD" | chpasswd
            echo "User $USERNAME created."
        fi
        ;;
    delete)
        if id "$USERNAME" &>/dev/null; then
            userdel "$USERNAME"
            echo "User $USERNAME deleted."
        else
            echo "User $USERNAME does not exist."
        fi
        ;;
    *)
        echo "Usage: $0 {create|delete} username [password]"
        exit 1
        ;;
esac

