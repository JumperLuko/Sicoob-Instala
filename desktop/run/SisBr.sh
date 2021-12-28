#!/bin/bash

#! Se não houver instalação informar o usuário e abrir arquivo do instalador do adobe. Também criar arquivo desktop para realizar instalação, assim que terminado apagar ele

adobeAIR=AdobeAIRInstaller.exe
instaladorPasta="/opt/sicoob/instaladores"

# Verifica se há instalador do adobeAIR e se não está instalado, então ele abre o instalador
#! Gera atrazo na primeira inicialização do usuário, e o desktop não aparece enquanto não finalizar wine
if [ -e "$instaladorPasta"/"$adobeAIR" ] && ! [ -e ".wine/drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" ]; then
    gnome-terminal -- bash -c 'adobeAIR=AdobeAIRInstaller.exe && instaladorPasta="/opt/sicoob/instaladores" &&\
 echo -e "Aperte enter para Instalar \e[5;1;32mdependencia do SisBR\e[0m (Adobe AIR)" && read &&\
 wine "$instaladorPasta"/"$adobeAIR"'
else
    wine /opt/sicoob/wine/drive_c/Sisbr\ 2.0/Sisbr\ 2.0.exe
fi

if ! [ -e "$HOME/.wine/drive_c/windows/Fonts/corefonts.installed" ]; then
    winetricks corefonts &
fi

unset adobeAIR instaladorPasta