#!/bin/bash

# Gerar repositório do wine
#! Depois isso será movimentado para uma verificação geral, não só do SisBR
wine wineboot

# Verifica se há instalador do adobeAIR e se não está instalado, então ele abre o instalador
if [ -e /opt/wine/instaladores/$adobeAIR ] && ! [ -e ".wine/drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" ]; then
    wine /opt/wine/instaladores/AdobeAIRInstaller.exe
fi