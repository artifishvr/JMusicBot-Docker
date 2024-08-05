#!/bin/bash

echo "     _ __  __           _      ____        _   "
echo "    | |  \/  |_   _ ___(_) ___| __ )  ___ | |_ "
echo " _  | | |\/| | | | / __| |/ __|  _ \ / _ \| __|"
echo "| |_| | |  | | |_| \__ \ | (__| |_) | (_) | |_ "
echo " \___/|_|  |_|\__,_|___/_|\___|____/ \___/ \__|"

echo "Image by artifishvr <3"
echo "=============================="
                                                
# Read environment variables
token="$TOKEN"
owner="$OWNER"
prefix="$PREFIX"

# Template for config.txt
template="// This is the configuration file for JMusicBot.
token = $token

owner = $owner

prefix = \"$prefix\"

"

echo "Creating Config..."
# Replace the placeholders in the template with environment variable values
configFileContent=$(printf "$template")

# Write config.txt file
echo "$configFileContent" > config.txt

echo "Starting..."
echo "=============================="
# Start JMusicBot
java -jar JMusicBot.jar -Dnogui=true
