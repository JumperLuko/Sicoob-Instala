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
source $scriptsDir/_GeneralFunctions.sh

# Diretórios
sicoobFolder="/opt/sicoob/"
wineFolder="/opt/sicoob/wine/"
instaladoresFolder="/opt/sicoob/instaladores/"
runFolder="/opt/sicoob/run/"

# Wine uninstaller
echo "Rodando desinstalador em $wineFolder"
sudo WINEPREFIX="$wineFolder" wine uninstaller 2>> $HOME/Downloads/SicoobInstalado.log

# Remover pasta inteira do wine do sistem
#echo "removendo pasta do do wine"
#sudo rm $wineFolder -R