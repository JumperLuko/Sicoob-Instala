#!/bin/bash

# Verificar caminhos das dependencias
if [ $(pwd) == "/opt/sicoob/Sicoob-Instala" ];then
    scriptsDir=/home/luko/Desktop/Sicoob-Instala/scripts
    relativeDir=/home/luko/Desktop/Sicoob-Instala
elif [ "$scriptsDir" == "" ] && [ -e "./scripts/" ];then
    scriptsDir=./scripts
    relativeDir=.
elif [ "$scriptsDir" == "" ];then
    scriptsDir=.
    relativeDir=..
fi

# Dependendencias
source $scriptsDir/_GeneralFunctions.sh

# Criar pasta se não existir
if ! [ -d "/opt/sicoob" ]; then 
    echo "Criando pasta Sicoob"
    sudo mkdir /opt/sicoob 
fi

if [ -e "/usr/bin/git" ]; then
    # Atualizar arquivos
    if ! [ -d "/opt/sicoob/Sicoob-Instala" ]; then
        echo "Clonando repositório"
        sudo git clone https://github.com/JumperLuko/Sicoob-Instala.git /opt/sicoob/Sicoob-Instala
    elif [ -d "/opt/sicoob/Sicoob-Instala" ]; then
        (cd /opt/sicoob/Sicoob-Instala && sudo git pull)
    fi
    if [ -e "/opt/sicoob/Sicoob-Instala/desktop/run/SicoobInstala.sh" ] && ! [ -e "/usr/bin/sicoob-instala" ]; then
        sudo ln -s /opt/sicoob/Sicoob-Instala/desktop/run/SicoobInstala.sh /usr/bin/sicoob-instala
    fi
    echo "Fim da Atualização do sicoob instala em /opt/sicoob/Sicoob-Instala"
else
    echo "Git não instalado, não será possivel atualizar sicoob instala"
fi

