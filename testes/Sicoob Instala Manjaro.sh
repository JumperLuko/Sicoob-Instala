# Update repo
sudo pacman -Sy

#Install basic programs
sudo pacman -S sssd ntp samba smbclient wine winetricks x11vnc git gitui mono-tools libxtst icedtea-web
yay -S --needed --noconfirm realmd adcli oddjob policycoreutils
