if [ -f general.yml ]; then
mv general.yml autoplug/general.yml
fi
if [ -f updater.yml ]; then
mv updater.yml autoplug/updater.yml
fi
java -Xms128M -Xmx"$1"M -Dterminal.jline=false -Dterminal.ansi=true -jar "$2"
