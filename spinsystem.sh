#!/bin/bash

echo "This script will install these tools for your dev environment"

echo "================= openJDK  ================="
echo "=================  git  ======================="
echo "================= VScode   ===================="
echo "================= Docker ======================"


echo
echo
echo "=============================Installation process for openJDK============================="

##Installation process for openJDK
read -p "continue installation of openJDK 8? [y/n]  " ANSWER

case "$ANSWER" in
    [yY] )
        echo "installing openJDK 8"
        sudo apt-get update
        sudo apt-get install openjdk-8-jdk
        echo "openJDK version 1.8 installed"
        ;;
    [nN] )
        echo "Skipping installation for open JDK"
        ;;
    *)
    echo "Please enter a valid input: y/Y or n/N"
    ;;
esac


echo
echo
echo "=============================Installation process for git============================="

##Installation process for git
read -p "continue installation of git ? [y/n]  " ANSWER

case "$ANSWER" in
    [yY] )
        echo "Installing git.............."
        sudo apt update
        sudo apt install git
        echo "Configuring git for your system........"
        read -p "continue configuring git ? [y/n]  " CONFIG

        if [ $CONFIG == "y" ]
        then
            read -p "enter your git username: " username
            git config --global user.name "$username"
            read -p "enter your git email: " email
            git config --global user.email "$email"
        else
            echo "Skipping configuration"
            echo "Installation of git completed......."
        fi
        ;;
    [nN] )
        echo "Skipping installation of git"
        ;;
    *)
    echo "Please enter a valid input: y/Y or n/N"
    ;;
esac


echo
echo
echo "=============================Installation process for Docker============================="

#Intallation process for Docker
read -p "continue installation of Docker? [y/n] " ANSWER

case "$ANSWER" in
    [yY] )
        echo "Installing Docker........."
        sudo apt update
        sudo apt install curl
        sudo apt install apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
        sudo apt update
        sudo apt-cache policy docker-ce
        sudo apt install docker-ce
        echo "latest version of Docker installed"
        sleep 1
        echo "docker is not added as root. Add sudo before all docker commands"
        ;;
    [nN] )
        echo "Skipping installation of Docker"  
        ;;
    *)
    echo "Please enter a valid input: y/Y or n/N"
    ;;
esac 

echo "Installation complete.......exiting"
