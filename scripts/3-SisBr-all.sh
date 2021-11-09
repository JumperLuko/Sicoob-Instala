#!/bin/bash

# Verificar caminhos das dependencias
if [ "$scriptsDir" == "" ] && [ -e "./scripts/" ];then
    scriptsDir=./scripts
    relativeDir=.
elif [ "$scriptsDir" == "" ];then
    scriptsDir=.
    relativeDir=..
fi

# Criar pasta da sicoob, e criar pasta dos scripts do usuário
#sudo mkdir /opt/sicoob/
#sudo mkdir /opt/sicoob/user/

# Copia o arquivo do usuário
echo "Copiando script do usuário que verifica instalação ao iniciar sessão e arrumando a permissão"
sudo cp profile.d/3-SisBr-user-install.sh /etc/profile.d/
sudo chmod -x /etc/profile.d/3-SisBr-user-install.sh

echo "Executando script de instalação"
$scriptsDir/3-SisBr-system-install.sh