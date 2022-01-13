#!/bin/bash

# Baixar pacotes
wget https://products.s.kaspersky-labs.com/endpoints/keslinux10/11.2.0.4528/multilanguage-11.2.0.4528/3437313131347c44454c7c31/kesl_11.2.0-4528_amd64.deb
wget https://products.s.kaspersky-labs.com/endpoints/keslinux10/11.2.0.4528/multilanguage-11.2.1.4528/3437373638347c44454c7c4e554c4c/kesl-gui_11.2.0-4528_amd64.deb

# Instalar antivirus
sudo gdebi kesl_11.2.0-4528_amd64.deb

# Configurar antivirus
# Esteja preparado para colocar a licença
sudo /opt/kaspersky/kesl/bin/kesl-setup.pl

#Instalar interface grafica (gui) do antivirus 
sudo gdebi kesl-gui_11.2.0-4528_amd64.deb