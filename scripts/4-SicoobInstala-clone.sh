#!/bin/bash

# Criar pasta se não existir
if ! [ -d "/opt/sicoob" ]; then 
    echo "Criando pasta Sicoob"
    sudo mkdir /opt/sicoob 
fi

# Atualizar arquivos
if ! [ -d "/opt/sicoob/Sicoob-Instala" ]; then
    Clonando repositório
    sudo git clone https://github.com/JumperLuko/Sicoob-Instala.git /opt/sicoob/Sicoob-Instala
elif [ -d "/opt/sicoob/Sicoob-Instala" ]; then
    (cd /opt/sicoob/Sicoob-Instala && sudo git pull)
fi

