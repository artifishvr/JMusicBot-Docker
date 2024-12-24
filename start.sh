#!/bin/bash

echo "     _ __  __           _      ____        _   "
echo "    | |  \/  |_   _ ___(_) ___| __ )  ___ | |_ "
echo " _  | | |\/| | | | / __| |/ __|  _ \ / _ \| __|"
echo "| |_| | |  | | |_| \__ \ | (__| |_) | (_) | |_ "
echo " \___/|_|  |_|\__,_|___/_|\___|____/ \___/ \__|"

echo "Image from https://github.com/artifishvr/JMusicBot-Docker"
echo "=============================="

# Read environment variables
token="${TOKEN:-}"
owner="${OWNER:-}"
prefix="${PREFIX:-!}"
potoken="${PO_TOKEN:-}"
visitordata="${VISITOR_DATA:-}"

# Check required variables
missing=0

if [ -z "$token" ]; then
    echo "Error: token is required"
    missing=1
fi

if [ -z "$prefix" ]; then
    echo "Error: prefix is required" 
    missing=1
fi

if [ -z "$owner" ]; then
    echo "Error: owner is required"
    missing=1
fi

if [ -z "$potoken" ]; then
    echo "Error: potoken is required"
    missing=1
fi

if [ -z "$visitordata" ]; then
    echo "Error: visitordata is required"
    missing=1
fi

if [ $missing -eq 1 ]; then
    exit 1
fi

# Template for config.txt
read -r -d '' template << 'EOF'
// Configuration file for JMusicBot

// Bot token
token = %s

// Bot owner ID
owner = %s

// Command prefix
prefix = "%s"

// YouTube tokens
ytpotoken = "%s"
ytvisitordata = "%s"
EOF

echo "Creating Config..."
# Format the template with variables
printf "$template" "$token" "$owner" "$prefix" "$potoken" "$visitordata" > config.txt

echo "Starting..."
echo "=============================="
# Start JMusicBot
java -jar JMusicBot.jar -Dnogui=true