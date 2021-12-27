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
adobeAIR=AdobeAIRInstaller.exe
SisBr=Sisbr20.exe

# Verificando se existe instaçador do adobeAIR e SisBr
verificaInstalador "$adobeAIR"
verificaInstalador "$SisBr"

# Instalar AdobeAir na pasta do sistema (precaução)
verificaInstalaWine "drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" "$adobeAIR"

# Instalar SisBR
verificaInstalaWine "drive_c/Sisbr 2.0/Sisbr 2.0.exe" "$SisBr"

# Copia executavel do SisBr
echo "Copiando executavel SH do SisBr"
sudo cp "$relativeDir/desktop/run/SisBr.sh" /opt/sicoob/run/
sudo chmod +x "/opt/sicoob/run/SisBr.sh"
sudo ln -s /opt/sicoob/run/SisBr.sh /usr/bin/sisbr

#! Copiar .desktop
echo "Copiando arquivo .desktop"
sudo cp $relativeDir/desktop/Sisbr_2.0.desktop /usr/share/applications/

# Copiar icones para o sistema
echo "Inserindo icones do programa no sistema"
sudo cp -r $relativeDir/desktop/hicolor/* /usr/share/icons/hicolor/

# Permissão para todos editarem
addPerm777 "$wineFolder""drive_c/Sisbr 2.0/" "SisBr"

# SisBR irá atualizar e rodar automáticamente

