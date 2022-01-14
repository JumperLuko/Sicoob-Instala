#!/bin/bash

# Verificar caminhos das dependencias
if [ "$scriptsDir" == "" ] && [ -e "./scripts/" ];then
    scriptsDir=./scripts
    relativeDir=.
elif [ "$scriptsDir" == "" ];then
    scriptsDir=.
    relativeDir=..
fi

# Google Chrome (repo)
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Teams
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

# Anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
sudo sh -c 'echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list'

# TeamViewer
# wget -O - https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo apt-key add -
# sudo apt-add-repository "deb http://linux.teamviewer.com/deb stable main"

# Onedrive CLI
sudo add-apt-repository ppa:yann1ck/onedrive -yn

# Update and Install programs
sudo apt update
sudo apt install google-chrome-stable teams anydesk teamviewer onedrive

# # OnlyOffice
# # adiciona via flatpak já
# if ! [ -e "$relativeDir/instaladores/onlyoffice-desktopeditors_amd64.deb" ]; then
#     wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb -P $relativeDir/instaladores
# fi
# sudo gdebi $relativeDir/instaladores/onlyoffice-desktopeditors_amd64.deb

# Zoom meeting
if ! [ -e "$relativeDir/instaladores/zoom_amd64.deb" ]; then
    wget https://zoom.us/client/latest/zoom_amd64.deb -P $relativeDir/instaladores
fi
sudo gdebi $relativeDir/instaladores/zoom_amd64.deb

# Adobe Reader
wget ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb -P $relativeDir/instaladores
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libxml2:i386 libcanberra-gtk-module:i386 gtk2-engines-murrine:i386 libatk-adaptor:i386
sudo dpkg -i $relativeDir/instaladores/AdbeRdr9.5.5-1_i386linux_enu.deb

# Forticlient VPN
echo -e "\n\e[36mForticlient VPN\e[0m"
echo "Download direto: https://links.fortinet.com/forticlient/deb/vpnagent"
#echo "https://www.fortinet.com/support/product-downloads"