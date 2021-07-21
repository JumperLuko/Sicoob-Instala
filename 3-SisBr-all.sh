#!/bin/bash

# Criar pasta da sicoob, e criar pasta dos scripts do usuário
#sudo mkdir /opt/sicoob/
#sudo mkdir /opt/sicoob/user/

# Copia o arquivo do usuário e da permissão de executar
echo "Copiando script do usuário que verifica instalação ao iniciar sessão"
sudo cp 3-SisBr-all.sh /etc/profile.d/
sudo chmod +x /etc/profile.d/3-SisBr-all.sh

echo "Executando script de instalação"
3-SisBr-system-install.sh