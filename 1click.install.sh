#!/bin/bash

# Display Banner
echo -e "\033[96m+===================================================+\033[0m";
echo -e "\033[96m|  _     _                  ____            _     _ |\033[0m";
echo -e "\033[96m| | |   (_)_ __  _   ___  _|  _ \ _ __ ___ (_) __| ||\033[0m";
echo -e "\033[96m| | |   | |  _ \| | | \ \/ / | | |  __/ _ \| |/ _  ||\033[0m";
echo -e "\033[96m| | |___| | | | | |_| |>  <| |_| | | | (_) | | (_| ||\033[0m";
echo -e "\033[96m| |_____|_|_| |_|\__,_/_/\_\____/|_|  \___/|_|\__,_||\033[0m";
echo -e "\033[96m|                     By  Vivek W                   |\033[0m";
echo -e "\033[96m|                                                   |\033[0m";
echo -e "\033[96m|            🔥GitHub:- Github.com/AryanVBW         |\033[0m";
echo -e "\033[96m|              🌐Site:- AryanVBW.github.io          |\033[0m";
echo -e "\033[96m|         💖Instagram:- Aryan_Technolog1es          |\033[0m";
echo -e "\033[96m+===================================================+\033[0m";
echo -e "\e[32mWelcome to the LinuxDroid Setup Script!\e[0m"

# Update package lists
echo -e "\n\e[32mUpdating package lists...\e[0m"
pkg update -y

# Upgrade installed packages
echo -e "\n\e[32mUpgrading installed packages...\e[0m"
pkg upgrade -y

# Set up storage permissions
echo -e "\n\e[32mSetting up storage permissions...\e[0m"
termux-setup-storage

# Install wget and figlet
echo -e "\n\e[32mInstalling wget and figlet...\e[0m"
pkg install wget -y
pkg install figlet -y

# Download necessary scripts
echo -e "\n\e[32mDownloading LinuxDroid scripts...\e[0m"
wget https://github.com/AryanVBW/LinuxDroid/releases/download/scripts/LinuxDroidmenu.sh && chmod +x LinuxDroidmenu.sh
wget https://github.com/AryanVBW/LinuxDroid/releases/download/A1/default.bashrc && chmod +x default.bashrc

# Replace .bashrc with the downloaded one
echo -e "\n\e[32mConfiguring bashrc...\e[0m"
rm -rf .bashrc && cp default.bashrc .bashrc

# Download the main LinuxDroid script
echo -e "\n\e[32mDownloading the main LinuxDroid script...\e[0m"
wget https://github.com/AryanVBW/LinuxDroid/releases/download/scripts/LinuxDroid.sh && chmod +x LinuxDroid.sh

echo -e "\e[32mAndroid Device Information:\e[0m"
getprop | grep "ro.product.model" | cut -d ':' -f 2 | tr -d ' ' | sed 's/^/  Model: /'
getprop | grep "ro.build.version.release" | cut -d ':' -f 2 | tr -d ' ' | sed 's/^/  Android Version: /'
getprop | grep "gsm.version.baseband" | cut -d ':' -f 2 | tr -d ' ' | sed 's/^/  Baseband Version: /'
getprop | grep "ro.boot.serialno" | cut -d ':' -f 2 | tr -d ' ' | sed 's/^/  Serial Number: /'

echo -e "\n\e[32mLaunching LinuxDroid...\e[0m"
bash LinuxDroid.sh

# Ask user if they want to install LinuxDroid AI chatbot
echo -e "\n\e[33mDo you want to install LinuxDroid AI chatbot? (y/n)\e[0m"
read choice

if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    echo -e "\n\e[32mInstalling LinuxDroid AI chatbot...\e[0m"
    wget https://raw.githubusercontent.com/minhmc2007/LinuxDroid/main/Scripts/setupAI.py ~/setupAI.py 
    python3 setupAI.py
else
    echo -e "\n\e[32mSkipping AI chatbot installation...\e[0m"
fi

echo -e "\n\e[32mLinuxDroid setup complete!\e[0m"
