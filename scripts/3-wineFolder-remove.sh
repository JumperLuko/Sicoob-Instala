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

echo "A pasta 'wine' contem todos programas de Windows que rodam sob a camada de compatibilidade WINE, pode conter instalação do Sisbr e Gercoop"
echo "Você tem certeza que deseja remover a pasta 'wine'?"
sim_nao_echo;if [ "$sim_ou_nao" == "sim" ];then
    sudo rm -R /opt/sicoob/wine/
fi