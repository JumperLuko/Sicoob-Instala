#!/bin/bash

# Carimbar arquivo de log
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
echo "Basic packages OS & basic config: $timestamp" >> $HOME/Downloads/SicoobInstala.log

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

#! Tenho achar forma de verificar se o Firewall está bloqueando os repositórios e trocar automáticamente, ou abrir a janela para o administrador mudar os repositórios (e tbm infomar ele o que deve fazer)

echo -e "Verifique se o \e[1;34mhorário do sistema\e[0m está correto e aperte enter"
read

#! Copiar .desktop
echo "Copiando arquivo .desktop do Sicoob Instala"
sudo cp $relativeDir/desktop/Sicoob-Instala.desktop /usr/share/applications/

#! Copiar .desktop restart Gnome
sudo cp $relativeDir/desktop/restart-gnome.desktop /usr/share/applications/

# Clonar repositório Github
source $scriptsDir/4-SicoobInstala-clone.sh

# Permiti que usuários coloquem senha do wifi
sudo cp $criptsDir/localauthority/10-network-manager.pkla /etc/polkit-1/localauthority/50-local.d/
#service network-manager restart

# Atualizar corretamente os repositórios
sudo apt update
sudo apt upgrade -y

# Instalar pacotes básicos
# obs: não terá -y, pois por segurança é para o administrador checar se os pacotes serão instalados sem quebrar algo. Estamos lidando com componente que deve ser sólido, o sistema, então a checagem é importante!
# `sssd-ad sssd-tools reamd adcli` para instalar o AD
# `samba e smbclient` são para realizar compartilhamento de arquivos na rede
# `wine wine64 wine32:i386 winetricks mono-dbg` é a camada de compatibilidade de apps Windows em 64b e 32b
# `x11vnc` para acessar via vnc o desktop
# `libxtst6:i386` para biblioteca java do caixa
# `icedtea-netx` para instalar o Sicobnet Empresarial
# `openssh-server` para cesso externo via linha de comando
# `gdebi` para instala pacotes deb
# `ntpdate` ferramenta para verificar se o horário do PC está sincronizado com a internet
# `menulibre` Para icones no sistema funcionarem. !Algo sem isso não está deixando os icones funcionarem
sudo apt install sssd-ad sssd-tools realmd adcli samba smbclient wine wine64 wine32:i386 winetricks mono-dbg x11vnc git git-gui libxtst6:i386 icedtea-netx openssh-server unattended-upgrades gdebi ntpdate ttf-mscorefonts-installer winbind menulibre chrome-gnome-shell pip autofs cifs-utils pwgen

# Clonar repositório Github, novamente caso o pacote não tenha sido instalado antes
source $scriptsDir/4-SicoobInstala-clone.sh

# Gnome-shell extensions via cli
sudo pip install --system gnome-extensions-cli

if [ -e "/usr/bin/onedrive" ]; then
    # Copia executavel do Onedrive
    echo "Copiando executavel SH do Onedrive"
    sudo cp "$relativeDir/desktop/run/Onedrive.sh" /opt/sicoob/run/
    sudo chmod +x "/opt/sicoob/run/Onedrive.sh"
    sudo ln -s /opt/sicoob/run/Onedrive.sh /usr/bin/onedrive-prompt

    #! Copiar .desktop
    echo "Copiando arquivo .desktop"
    sudo cp $relativeDir/desktop/Onedrive.desktop /usr/share/applications/

    # Copiar icones para o sistema
    echo "Inserindo icones do programa no sistema"
    sudo cp -r $relativeDir/desktop/hicolor/* /usr/share/icons/hicolor/
fi

# Instalar Pacotes Flatpaks
# `pdfarranger` para organizar paginas de PDF
# `onlyoffice` para suite office
sudo flatpak install flathub com.github.jeromerobert.pdfarranger org.onlyoffice.desktopeditors -y
# Permissão par ao OnlyOffice acessar Samba
sambaPerm="sudo flatpak override --filesystem=xdg-run/gvfs"
$sambaPerm org.onlyoffice.desktopeditors; $sambaPerm com.github.jeromerobert.pdfarranger
# Extras porém relevantes
sudo flatpak install flathub io.bit3.WhatsAppQT org.telegram.desktop com.bitstower.Markets com.github.hugolabe.Wike com.github.gi_lom.dialect org.gabmus.whatip org.gnome.BreakTimer com.belmoussaoui.Decoder com.belmoussaoui.Obfuscate -y
# Permissões para acessar samba
$sambaPerm io.bit3.WhatsAppQT; $sambaPerm org.telegram.desktop;

# Flatpak atualizar automáticamente
# https://www.jwillikers.com/automate-flatpak-updates-with-systemd
sudo cp $scriptsDir/services/update-system-flatpaks.service /etc/systemd/system/
sudo cp $scriptsDir/services/update-system-flatpaks.timer /etc/systemd/system/
sudo systemctl --system enable --now update-system-flatpaks.timer

# APT atualizar automáticamente
# sudo cp $scriptsDir/services/apt-upgrade-force.service /etc/systemd/system/
# sudo cp $scriptsDir/services/apt-upgrade-force.timer /etc/systemd/system/
# sudo systemctl --system enable --now apt-upgrade-force.timer

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

# Disable scroll lock (bug de travamento com teclas de funções no teclado BR)
sudo sed -i -e 's/    modifier_map Mod3   { Scroll_Lock };/    #modifier_map Mod3   { Scroll_Lock };/' /usr/share/X11/xkb/symbols/br

# Administrador local
#echo "Criando usuário administrador local"
#sudo adduser administrador
#sudo adduser administrador sudo

echo -e "\nAlterar \e[34msenha de root\e[0m?"
sim_nao;if [ "$sim_ou_nao" == "sim" ];then
    sudo passwd root
fi

source $scriptsDir/1-hostname.sh

echo "Configuração finalizada!"
