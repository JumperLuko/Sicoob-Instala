#!/bin/bash

# Dependendencias
source ./_GeneralFunctions.sh

# Diretórios
sicoobFolder="/opt/sicoob/"
wineFolder="/opt/sicoob/wine/"
instaladoresFolder="/opt/sicoob/instaladores/"
runFolder="/opt/sicoob/run/"

# Wine uninstaller
echo "Rodando desinstalador em $wineFolder"
sudo WINEPREFIX="$wineFolder" wine uninstaller

# Remover pasta inteira do wine do sistem
#echo "removendo pasta do do wine"
#sudo rm $wineFolder -R