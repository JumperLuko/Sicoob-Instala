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

# copiar instalador para /opt/wine/instaladores/
Gercoop=Gercoop.exe

#! Verificar se há conexão com o servidor, pois a é necessário para instalação

# Verificando se existe o arquivo do Gercoop na pasta local
verificaInstalador "$Gercoop"

# Instalar Gercoop
verificaInstalaWine "drive_c/GerCoop/GerCoop.exe" "$Gercoop"

# Copia executavel do Gercoop
echo "Copiando executavel SH do Gercoop"
sudo cp "relativeDir/desktop/Gercoop.sh" /opt/sicoob/run/
sudo chmod +x "/opt/sicoob/run/Gercoop.sh"

#! Copiar .desktop
echo "Copiando arquivo .desktop"
sudo cp relativeDir/desktop/GerCoop.desktop /usr/share/applications/

# Copiar icones para o sistema
echo "Inserindo icones do programa no sistema"
sudo cp -r relativeDir/desktop/hicolor/* /usr/share/icons/hicolor/

# Permissão para todos editarem
addPerm777 "$wineFolder""drive_c/GerCoop/" "Gercoop"
