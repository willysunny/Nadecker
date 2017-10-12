#!/bin/sh

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

echo ""
echo "Linking Nadeko Credentials"
mv -n /opt/NadekoBot/src/NadekoBot/credentials.json /root/nadeko/credentials.json > /dev/null 2>&1
rm /opt/NadekoBot/src/NadekoBot/credentials.json > /dev/null 2>&1
ln -s /root/nadeko/credentials.json /opt/NadekoBot/src/NadekoBot/credentials.json > /dev/null 2>&1

echo ""
echo "Patching Nadeko Data Folder"
mkdir -p /root/nadeko/patch
cd /root/nadeko/patch && bash "./patch.sh"

echo ""
echo "Starting Redis-Server"
/usr/bin/redis-server --daemonize yes

echo ""
echo "Running NadekoBot with auto restart Please wait."
cd /opt/NadekoBot/src/NadekoBot
while :; do dotnet run -c Release; sleep 5s; done
echo "Done"

exit 0
