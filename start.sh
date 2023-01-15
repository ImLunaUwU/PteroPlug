#!/bin/sh
if [ ! -f hasrun ]; then
echo "Waiting for congfigs to apply. Please wait 5 seconds."
sleep 5
echo 'The server has run more than once.' > hasrun
else
java -Xmx8m -Dterminal.jline=false -Dterminal.ansi=true -jar "$1"
fi
