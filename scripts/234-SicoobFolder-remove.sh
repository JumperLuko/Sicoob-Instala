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

echo "A pasta 'sicoob' pode conter configuração de senha do vnc, instalação do Sisbr e Gercoop"
echo "Você tem certeza que deseja remover a pasta 'sicoob'?"
sim_nao_echo;if [ "$sim_ou_nao" == "sim" ];then
    sudo rm -R /opt/sicoob/
fi