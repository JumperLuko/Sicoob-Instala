#!/bin/bash

sudo echo ""

# Criar arquivo com senha vnc + permissão de leitura
echo "Por favor digite a senha VNC"
sudo x11vnc -storepasswd /opt/sicoob/passwdvnc.pwd
sudo chmod +444 /opt/sicoob/passwdvnc.pwd

# Iniciar VNC ao iniciar usuário
echo "Configurando VNC ao iniciar usuário"
sudo cp profile.d/x11vnc-user.sh /etc/profile.d/

# Iniciar com sistema
#! Arquivo de inicialização não funciona pois o usuário guess está dando erro
#echo "Configurando VNC para iniciar com sistema" 
#sudo cp x11vnc-sicoob.service /etc/systemd/system/
#sudo systemctl enable x11vnc-sicoob
#sudo systemctl start x11vnc-sicoob

#! vnc para todo o sistema?
#https://jasonschaefer.com/setup-x11vnc-server-with-systemd-auto-start-up/

# Rodar VNC
#x11vnc

# Rodar VNC com senha pelo terminal
#sudo x11vnc -passwd 123 -forever

# Rodar VNC com arquivo de senha
#sudo x11vnc -rfbauth /opt/sicoob/passwdvnc.pwd -forever

# Mostrar sessões ativas
#loginctl list-sessions