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
required_vars=("token" "prefix" "owner" "potoken" "visitordata")
missing_vars=()

for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        missing_vars+=("$var")
    fi
done

if [ ${#missing_vars[@]} -ne 0 ]; then
    echo "Error: The following environment variables are required:"
    printf '%s\n' "${missing_vars[@]}"
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