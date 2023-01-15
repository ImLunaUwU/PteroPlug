if [ !-f hasrun ]; then
echo -e "Running first run configs. Please wait 15 seconds."
sleep 15
if [ -f general.yml ]; then
mv general.yml autoplug/general.yml
fi
if [ -f updater.yml ]; then
mv updater.yml autoplug/updater.yml
fi
echo 'The server has run more than once.' > hasrun
else
java -Xms128M -Xmx"$1"M -Dterminal.jline=false -Dterminal.ansi=true -jar "$2"
fi
