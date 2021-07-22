#!/bin/bash

# Gerar repositório do wine
#! Depois isso será movimentado para uma verificação geral, não só do SisBR
#sleep 10
#wine wineboot &

# Verifica se há instalador do adobeAIR e se não está instalado, então ele abre o instalador
#! Gera atrazo na primeira inicialização do usuário, e o desktop não aparece enquanto não finalizar wine
if [ -e /opt/wine/instaladores/$adobeAIR ] && ! [ -e ".wine/drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" ]; then
    sleep 5 && wine /opt/wine/instaladores/AdobeAIRInstaller.exe &
fi
