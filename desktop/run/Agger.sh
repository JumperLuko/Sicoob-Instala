#!/bin/bash

# Verifica se há instalador do dotNet452_PTB e se não está instalado, então ele abre o instalador
# Se tiver tudo ok, inicializa o agger
#! Interessante ter mais condições, como a se não tiver instalador
dotNet452_PTB=NDP452-KB2901907-x86-x64-AllOS-PTB.exe
instaladorPasta="/opt/sicoob/instaladores"
wine32Folder="$HOME/.wine32/"

dotnet452Instalado="$HOME/.wine32/drive_c/windows/Microsoft.NET/Framework/v4.0.30319/Microsoft.Windows.ApplicationServer.Applications.45.man"
dotnet452PTBRInstalado="$HOME/.wine32/drive_c/windows/Microsoft.NET/Framework/v4.0.30319/pt-BR/aspnet.mfl"

if [ -e "$instaladorPasta"/"$dotNet452_PTB" ] && ! [ -e "$dotnet452Instalado" ] || ! [ -e "$dotnet452PTBRInstalado" ]; then
    gnome-terminal -- bash -c 'dotNet452_PTB=NDP452-KB2901907-x86-x64-AllOS-PTB.exe && instaladorPasta="/opt/sicoob/instaladores" && wine32Folder="$HOME/.wine32/" &&\
 echo -e "Aperte enter para Instalar \e[5;1;32mAgger e dependencias\e[0m (Dotnet 452 e tradução)" && read &&\
 env WINEPREFIX="$wine32Folder" WINEARCH="win32" wineboot 2>> $HOME/Downloads/SicoobInstala.log &&\
 WINEPREFIX="$wine32Folder" WINEARCH="win32" winetricks dotnet452 2>> $HOME/Downloads/SicoobInstala.log &&\
 WINEPREFIX="$wine32Folder" WINEARCH="win32" winetricks win7 &&\
 env WINEPREFIX="$wine32Folder" WINEARCH="win32" wine "$instaladorPasta"/"$dotNet452_PTB" 2>> $HOME/Downloads/SicoobInstala.log &&\
 env WINEPREFIX="$HOME/.wine32/" WINEARCH="win32" wine /opt/sicoob/instaladores/Instalador-agger.exe &&\
 read -p "Enter para sair"'
else
    env WINEPREFIX="$HOME/.wine32/" WINEARCH="win32" wine $HOME/.wine32/drive_c/AggerSeguros/Aggilizador.Application.exe
fi

if ! [ -e "$wine32Folder/drive_c/windows/Fonts/corefonts.installed" ]; then
    env WINEPREFIX="$wine32Folder" WINEARCH="win32" winetricks corefonts
fi

unset dotNet452_PTB instaladorPasta wine32Folder dotnet452Instalado dotnet452PTBRInstalado