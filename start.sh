#!/bin/bash
# PteroPlug Start Script
#
# 

echo "Checking for change in server software."
if [ "$2" = "purpur" ]; then
if [ ! -f purpur.jar ]; then
echo -e "Downloading Purpur server..."
curl -o ${SERVER_TYPE}.jar https://api.purpurmc.org/v2/purpur/${GAME_VERSION}/latest/download
rm -f paper.jar spigot.jar fabric.jar
fi
elif [ "$2" = "paper" ]; then
if [ ! -f paper.jar ]; then
rm -f spigot.jar purpur.jar fabric.jar
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo " "
echo " "
echo " "
echo " "
echo " "
echo "Due to the nature of Pterodactyl start scripts and PaperMC's awful download API, Paper can not be \"hotswapped\"."
echo "Please manually download Paper from https://papermc.io/downloads and place it in the server directory."
echo "Please note, it is required to be named \"paper.jar\", otherwise the server cannot start."
echo " "
echo " "
echo " "
echo " "
echo " "
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
exit
fi
elif [ "$2" = "spigot" ]; then
if [ ! -f spigot.jar ]; then
echo -e "Downloading Spigot server..."
curl -o ${SERVER_TYPE}.jar https://download.getbukkit.org/spigot/spigot-${GAME_VERSION}.jar
rm -f paper.jar purpur.jar fabric.jar
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo " "
echo " "
echo " "
echo " "
echo " "
echo -e "It is recommended that you switch to Purpur. It has better performance and is updated more often."
echo " "
echo " "
echo " "
echo " "
echo " "
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
elif [ "$2" = "fabric" ];
if [ ! -f fabric.jar ]; then
echo -e "Downloading Fabric server..."
wget -O ${SERVER_TYPE}.jar https://meta.fabricmc.net/v2/versions/loader/${GAME_VERSION}/${LOADER_VERSION}/${FABRIC_VERSION}/server/jar
rm -f paper.jar purpur.jar spigot.jar
fi
else
echo "No change in server software."
fi

if [ ! -f hasrun ]; then
echo "Waiting for congfigs to apply. Please wait 5 seconds."
sleep 5
echo 'The server has run more than once.' > hasrun
java -Xms128M -Xmx500M -Dterminal.jline=false -Dterminal.ansi=true -jar "$1"
else
java -Xms128M -Xmx500M -Dterminal.jline=false -Dterminal.ansi=true -jar "$1"
fi
