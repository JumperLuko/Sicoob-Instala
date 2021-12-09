#!/bin/bash

#| Mostrar sim ou não para funções
sim_nao() {
    while true; do
        read -p "$* [s/n]: " sn
        case $sn in
            [Ss]*) sim_ou_no="sim" && return 0  ;;  
            [Nn]*) printf "Cancelado\n\n" ; sim_ou_nao="nao" && return  1 ;;
        esac
        sim_ou_no="null"
    done
}

#! Tenho achar forma de verificar se o Firewall está bloqueando os repositórios e trocar automáticamente, ou abrir a janela para o administrador mudar os repositórios (e tbm infomar ele o que deve fazer)

echo -e "Verifique se o \e[1;34mhorário do sistema\e[0m está correto e aperte enter"
read

# Atualizar corretamente os repositórios
sudo apt update
sudo apt upgrade

# Instalar pacotes básicos
# obs: não terá -y, pois por segurança é para o administrador checar se os pacotes serão instalados sem quebrar algo. Estamos lidando com componente que deve ser sólido, o sistema, então a checagem é importante!
# `sssd-ad sssd-tools reamd adcli` para instalar o AD
# `samba e smbclient` são para realizar compartilhamento de arquivos na rede
# `wine wine32:i386` é a camada de compatibilidade de apps Windows em 64b e 32b
# `x11vnc` para acessar via vnc o desktop
sudo apt install sssd-ad sssd-tools realmd adcli samba smbclient wine wine64 wine32:i386 winetricks x11vnc git git-gui mono-dbg libxtst6:i386 icedtea-netx openssh-server unattended-upgrades gdebi ntpdate onedrive

# Descomente isto caso queira reinstalar o Desktop
#sudo apt install zorin-os-standard

# WineHq atualizado para Ubuntu 20.04 based
# sudo dpkg --add-architecture i386 
# wget -nc https://dl.winehq.org/wine-builds/winehq.key
# sudo apt-key add winehq.key
# sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -u
# sudo apt install --install-recommends winehq-stable

# Automatic updates
# https://www.blackmoreops.com/2021/10/28/how-to-configure-automatic-updates-in-ubuntu-server/
#sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
#sudo nano /etc/apt/apt.conf.d/20auto-upgrades
#/usr/lib/apt/apt.systemd.daily
#sudo service apt-daily start

# criar pasta de usuário automáticamente ao usuário entrar pelo AD
sudo pam-auth-update --enable mkhomedir

# Gerenciador de login em xorg, para permitir acesso remoto
sudo sed -i -e 's/# WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/custom.conf

# Configurar hostname
#! Colocar um prompt para confirmar o reboot com sim e não
echo "Por favor defina o nome da maquina, no bloco de notas que abrirá"
sleep 5
sudo gedit /etc/hostname

# Disable scroll lock (bug de travamento com teclas de funções no teclado BR)
sudo sed -i -e 's/    modifier_map Mod3   { Scroll_Lock };/    #modifier_map Mod3   { Scroll_Lock };/' /usr/share/X11/xkb/symbols/br

# Administrador local
#echo "Criando usuário administrador local"
#sudo adduser administrador
#sudo adduser administrador sudo

echo "Senha para root"
sudo passwd root

# reboot?
echo "Deseja reiniciar?"
echo "é recomendado para implementar o nome da maquina"
sim_nao;if [ "$sim_ou_nao" == "sim" ];then
    unset sim_ou_nao;echo "Reiniciando...";reboot
elif [ "$sim_ou_nao" == "nao" ];then
    unset sim_ou_nao;
    echo "Sem reboot"
fi

echo "Configuração finalizada!"
