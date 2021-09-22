#!/bin/bash

#! Se não houver instalação informar o usuário e abrir arquivo do instalador do adobe. Também criar arquivo desktop para realizar instalação, assim que terminado apagar ele

# Gerar repositório do wine
#! Depois isso será movimentado para uma verificação geral, não só do SisBR
#sleep 10
#wine wineboot &

adobeAIR=AdobeAIRInstaller.exe
instaladorPasta="/opt/sicoob/instaladores"

# Verifica se há instalador do adobeAIR e se não está instalado, então ele abre o instalador
#! Gera atrazo na primeira inicialização do usuário, e o desktop não aparece enquanto não finalizar wine
if [ -e "$instaladorPasta"/"$adobeAIR" ] && ! [ -e ".wine/drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" ]; then
    sleep 5 && wine "$instaladorPasta"/"$adobeAIR" &
fi

unset adobeAIR instaladorPasta