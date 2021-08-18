#!/bin/bash


echo "Por favor digite a senha VNC"
#! type the password

# Criar arquivo com senha vnc
x11vnc -storepasswd 123 passwdvncFILE

# Rodar VNC
#x11vnc

# Rodar VNC com senha pelo terminal
#sudo x11vnc -passwd 123 -forever

# Rodar VNC com arquivo de senha
#sudo x11vnc -rfbauth passwdvncFILE -forever