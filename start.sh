#!/bin/bash

echo "     _ __  __           _      ____        _   "
echo "    | |  \/  |_   _ ___(_) ___| __ )  ___ | |_ "
echo " _  | | |\/| | | | / __| |/ __|  _ \ / _ \| __|"
echo "| |_| | |  | | |_| \__ \ | (__| |_) | (_) | |_ "
echo " \___/|_|  |_|\__,_|___/_|\___|____/ \___/ \__|"

echo "Image from https://github.com/artifishvr/JMusicBot-Docker"
echo "=============================="
                                                
# Check if we have a config.txt file
if [ ! -f "config.txt" ]; then
    echo "Error: config.txt file not found. Create one using https://jmusicbot.com/config/ and mount it to /app/config.txt"
    exit 1
fi

echo "Starting..."
echo "=============================="
# Start JMusicBot
java -jar JMusicBot.jar -Dnogui=true
