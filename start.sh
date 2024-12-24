#!/bin/bash

echo "     _ __  __           _      ____        _   "
echo "    | |  \/  |_   _ ___(_) ___| __ )  ___ | |_ "
echo " _  | | |\/| | | | / __| |/ __|  _ \ / _ \| __|"
echo "| |_| | |  | | |_| \__ \ | (__| |_) | (_) | |_ "
echo " \___/|_|  |_|\__,_|___/_|\___|____/ \___/ \__|"

echo "Image from https://github.com/artifishvr/JMusicBot-Docker"
echo "=============================="
                                                
# Read environment variables
token="$TOKEN"
owner="$OWNER"
prefix="$PREFIX"
potoken="$PO_TOKEN"
visitordata="$VISITOR_DATA"

# Template for config.txt
template="// This is the configuration file for JMusicBot.
token = $token

owner = $owner

prefix = \"$prefix\"

ytpotoken = \"$potoken\"
ytvisitordata = \"$visitordata\"

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
