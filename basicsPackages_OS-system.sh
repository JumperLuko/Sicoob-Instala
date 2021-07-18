
#! Tenho achar forma de verificar se o Firewall está bloqueando os repositórios e trocar automáticamente, ou abrir a janela para o administrador mudar os repositórios (e tbm infomar ele o que deve fazer)

# Atualizar corretamente os repositórios
sudo apt update
sudo apt upgrade

# Instalar pacotes básicos
# `sssd-ad sssd-tools reamd adcli` para instalar o AD
# `samba e smbclient` são para realizar compartilhamento de arquivos na rede
# `wine wine32:i386` é a camada de compatibilidade de apps Windows em 64b e 32b
sudo apt install sssd-ad sssd-tools reamd adcli samba smbclient wine wine32:i386 -y

# Configurar hotsname
sudo nano /etc/hostname
echo "O computador irá REINICIAR em 60 segundos automáticamente"
sleep 60
reboot
