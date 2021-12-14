#!/bin/bash

#https://github.com/skilion/onedrive

# Carimbar arquivo de log
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
echo "onedrive-config: $timestamp" >> $HOME/Downloads/SicoobInstala.log

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

onedrive

# Copiar arquivo de configuração padrão
if ! [ -e "$HOME/.config/onedrive/config" ]; then 
    cp /usr/share/doc/onedrive/config ~/.config/onedrive/config
fi

# Mostrar configuração atual
echo -e "Abaixo configuração atual do Onedrive\n"
onedrive --display-config

# Configure
nano ~/.config/onedrive/config

# Ativar na inicialização e iniciar agora
systemctl --user enable onedrive
systemctl --user start onedrive

