#!/bin/bash

#! Se não houver instalação informar o usuário e abrir arquivo do instalador do adobe. Também criar arquivo desktop para realizar instalação, assim que terminado apagar ele

adobeAIR=AdobeAIRInstaller.exe
instaladorPasta="/opt/sicoob/instaladores"
wine64Folder="$HOME/.wine/"
# Utiliza wine-devel mais atualizado, senão utiliza a versão mais antiga do sistema 
if [ -e "/opt/wine-devel/bin/wine" ]; then
    wine_devel=/opt/wine-devel/bin/wine
else
    wine_devel=/usr/bin/wine
fi

# Verifica se há instalador do adobeAIR e se não está instalado, então ele abre o instalador
if [ -e "$instaladorPasta"/"$adobeAIR" ] && ! [ -e ".wine/drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" ]; then
    kdialog --msgbox "Instale o Adobe Air para executar o Sisbr\n\nTalvez precise aguardar um pouco" --title "SisBr 2.0" &
    env WINEPREFIX="$wine64Folder" $wine_devel "$instaladorPasta"/"$adobeAIR"
    # Executa o SisBr se o Adobe Air tiver instalado
    if [ -e ".wine/drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" ]; then
        env WINEPREFIX="$wine64Folder" $wine_devel /opt/sicoob/wine/drive_c/Sisbr\ 2.0/Sisbr\ 2.0.exe
    fi
# Se não tiver instalador, nem instalador, informa o usuário
elif ! [ -e "$instaladorPasta"/"$adobeAIR" ] && ! [ -e ".wine/drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" ]; then
    kdialog --error "Infelizmente não há AdobeAir no sistema\n\nPor favor contate o administrador do sistema" --title "SisBr 2.0"
else
    env WINEPREFIX="$wine64Folder" $wine_devel /opt/sicoob/wine/drive_c/Sisbr\ 2.0/Sisbr\ 2.0.exe
fi

if ! [ -e "$HOME/.wine/drive_c/windows/Fonts/corefonts.installed" ] && [ -e "$HOME/.wine/" ]; then
    env WINEPREFIX="$wine64Folder" WINE="$wine_devel" winetricks corefonts &
fi

unset adobeAIR instaladorPasta