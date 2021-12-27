#!/bin/bash

# Verificar caminhos das dependencias
if [ "$scriptsDir" == "" ] && [ -e "./scripts/" ];then
    scriptsDir=./scripts
    relativeDir=.
elif [ "$scriptsDir" == "" ];then
    scriptsDir=.
    relativeDir=..
fi

# Dependendencias
source $scriptsDir/3-wine-system-Install.sh

# Nomes dos instaladores
dotNet452_PTB=NDP452-KB2901907-x86-x64-AllOS-PTB.exe
Agger=Instalador-agger.exe

# sudo mkdir $wine32Folder
# sudo WINEPREFIX="$wine32Folder" WINEARCH="win32" wineboot
sudo WINEPREFIX="$wine32Folder" WINEARCH="win32" winetricks win7
sudo WINEPREFIX="$wine32Folder" WINEARCH="win32" winetricks dotnet452
sudo WINEPREFIX="$wine32Folder" WINEARCH="win32" winetricks win7

echo "Baixar http://go.microsoft.com/fwlink/?linkid=328839&clcid=0x416"
read -p 'enter para continuar'

sudo WINEPREFIX="$wine32Folder" WINEARCH="win32" wine $dotNet452_PTB
sudo WINEPREFIX="$wine32Folder" WINEARCH="win32" wine $Agger

# Verificando se existe instaçador do dotNet452_PTB e Agger
verificaInstalador "$dotNet452_PTB"
verificaInstalador "$Agger"

# Instalar dotNet452_PTB na pasta do sistema (precaução)
verificaInstalaWine32 "drive_c/windows/Microsoft.NET/Framework/v4.0.30319/Microsoft.Windows.ApplicationServer.Applications.45.man" "$dotNet452_PTB"

# Instalar Agger
verificaInstalaWine32 "drive_c/AggerSeguros/Aggilizador.Application.exe" "$Agger"

#! Copiar .desktop
echo "Copiando arquivo .desktop"
sudo cp $relativeDir/desktop/Aggilizador.desktop /usr/share/applications/

# Copiar icones para o sistema
echo "Inserindo icones do programa no sistema"
sudo cp -r $relativeDir/desktop/hicolor/* /usr/share/icons/hicolor/

# # Permissão para todos editarem
addPerm777 "$wineFolder32""" "Agger"