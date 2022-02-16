#!/bin/bash

# Verifica se há instalador do dotNet452_PTB e se não está instalado, então ele abre o instalador
# Se tiver tudo ok, inicializa o agger
dotNet452_PTB=NDP452-KB2901907-x86-x64-AllOS-PTB.exe
instaladorPasta="/opt/sicoob/instaladores"
wine32Folder="$HOME/.wine32/"
logFile="$HOME/.cache/SicoobInstala.log"

dotnet452Instalado="$HOME/.wine32/drive_c/windows/Microsoft.NET/Framework/v4.0.30319/Microsoft.Windows.ApplicationServer.Applications.45.man"
dotnet452PTBRInstalado="$HOME/.wine32/drive_c/windows/Microsoft.NET/Framework/v4.0.30319/pt-BR/aspnet.mfl"

#! Experimentar migrar para wine 7, utilizando arquitetura x64
if [ -e "$instaladorPasta"/"$dotNet452_PTB" ] && ! [ -e "$dotnet452Instalado" ]; then
    kdialog --yesno "Você deseja instalar o Agger?\n\nDurante o processo deverá clicar sim ao o que aparecer\n\nO processo é demorado" --title "Agger"
    if [ $? = 0 ]; then
        env WINEPREFIX="$wine32Folder" WINEARCH="win32" wineboot 2>> $logFile
        WINEPREFIX="$wine32Folder" WINEARCH="win32" winetricks dotnet452 2>> $logFile
        WINEPREFIX="$wine32Folder" WINEARCH="win32" winetricks win7
        env WINEPREFIX="$wine32Folder" WINEARCH="win32" wine "$instaladorPasta"/"$dotNet452_PTB" 2>> $logFile
        env WINEPREFIX="$HOME/.wine32/" WINEARCH="win32" wine /opt/sicoob/instaladores/Instalador-agger.exe
    fi
elif ! [ -e "$instaladorPasta"/"$dotNet452_PTB" ] && ! [ -e "$dotnet452Instalado" ]; then
    kdialog --error "Infelizmente não há dotNet452 ptb no sistema\n\nPor favor contate o administrador do sistema" --title "Agger"
else
    env WINEPREFIX="$HOME/.wine32/" WINEARCH="win32" wine $HOME/.wine32/drive_c/AggerSeguros/Aggilizador.Application.exe
fi

if ! [ -e "$wine32Folder/drive_c/windows/Fonts/corefonts.installed" ]; then
    env WINEPREFIX="$wine32Folder" WINEARCH="win32" winetricks corefonts
fi

unset dotNet452_PTB instaladorPasta wine32Folder dotnet452Instalado dotnet452PTBRInstalado logFile