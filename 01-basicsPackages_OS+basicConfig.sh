#!/bin/bash

#! Tenho achar forma de verificar se o Firewall está bloqueando os repositórios e trocar automáticamente, ou abrir a janela para o administrador mudar os repositórios (e tbm infomar ele o que deve fazer)

# Atualizar corretamente os repositórios
sudo apt update
sudo apt upgrade

# Instalar pacotes básicos
# obs: não terá -y, pois por segurança é para o administrador checar se os pacotes serão instalados sem quebrar algo. Estamos lidando com componente que deve ser sólido, o sistema, então a checagem é importante!
# `sssd-ad sssd-tools reamd adcli` para instalar o AD
# `samba e smbclient` são para realizar compartilhamento de arquivos na rede
# `wine wine32:i386` é a camada de compatibilidade de apps Windows em 64b e 32b
# `x11vnc` para acessar via vnc o desktop
sudo apt install sssd-ad sssd-tools realmd adcli samba smbclient wine wine32:i386 x11vnc

# Descomente isto caso queira reinstalar o Desktop
#sudo apt install zorin-os-standard

# criar pasta de usuário automáticamente ao usuário entrar pelo AD
sudo pam-auth-update --enable mkhomedir

# Configurar hostname
#! Colocar um prompt para confirmar o reboot com sim e não
echo "Por favor defina o nome da maquina, no bloco de notas que abrirá"
sleep 10
sudo gedit /etc/hostname
echo "O computador irá REINICIAR em 60 segundos automáticamente"
echo ""
echo "Será reiniciado para aplicar a configuração do novo nome da maquina, se fechar este terminal o reboot será cancelado"
sleep 60
reboot

