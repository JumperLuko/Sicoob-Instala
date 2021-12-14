#https://github.com/skilion/onedrive

onedrive

# Copiar arquivo de configuração padrão
cp /usr/share/doc/onedrive/config ~/.config/onedrive/config

# Mostrar configuração atual
onedrive --display-config

# Configure
nano ~/.config/onedrive/config

# Ativar na inicialização e iniciar agora
systemctl --user enable onedrive
systemctl --user start onedrive

