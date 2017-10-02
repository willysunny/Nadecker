#!/bin/sh
echo ""
echo "NadekoBot Installer started."

if hash git 1>/dev/null 2>&1
then
    echo ""
    echo "Git Installed."
else
    echo ""    
    echo "Git is not installed. Please install Git."
    exit 1
fi


if hash dotnet 1>/dev/null 2>&1
then
    echo ""
    echo "Dotnet installed."
else
    echo ""
    echo "Dotnet is not installed. Please install dotnet."
    exit 1
fi

root=/opt

cd "$root"

echo ""
echo "Downloading NadekoBot, please wait."
git clone -b 1.9 --recursive --depth 1 https://github.com/Kwoth/NadekoBot.git
echo ""
echo "NadekoBot downloaded."

echo ""
echo "Downloading Nadeko dependencies"
cd $root/NadekoBot
dotnet restore
echo ""
echo "Download done"

echo ""
echo "Building NadekoBot"
dotnet build --configuration Release
echo ""
echo "Building done."

echo ""
echo "Installation Complete."
exit 0