#!/bin/bash

# Dependendencias
source ./3-wine-system-Install.sh

# Nomes dos instaladores
adobeAIR=AdobeAIRInstaller.exe
SisBr=Sisbr20.exe

# Verificando se existe instaçador do adobeAIR e SisBr
verificaInstalador "$adobeAIR"
verificaInstalador "$SisBr"

# Instalar AdobeAir na pasta do sistema (precaução)
verificaInstalaWine "drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" "$adobeAIR"

# Instalar SisBR
verificaInstalaWine "drive_c/Sisbr 2.0/Sisbr 2.0.exe" "$SisBr"

#! Copiar .desktop
echo "Copiando arquivo .desktop"
sudo cp ./desktop/Sisbr_2.0.desktop /usr/share/applications/

# Copiar icones para o sistema
echo "Inserindo icones do programa no sistema"
sudo cp -r ./desktop/hicolor/* /usr/share/icons/hicolor/

# Permissão para todos editarem
addPerm777 "$wineFolder""drive_c/Sisbr 2.0/" "SisBr"

# SisBR irá atualizar e rodar automáticamente

