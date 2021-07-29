#!/bin/bash

# Dependendencias
./3-wine-system-Install.sh

# Nomes dos instaladores
adobeAIR=AdobeAIRInstaller.exe
SisBr=Sisbr20.exe

# Verificando se existe instaçador do adobeAIR e SisBr
verificaInstalador "$adobeAIR"
verificaInstalador "$SisBr"

# Instalar AdobeAir na pasta do sistema (precaução)
verificaNaoExisteArquivo "$wineFolder""drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" \
    (\
        echo "Instalando $adobeAIR" \
        sudo WINEPREFIX="$wineFolder" wine "$instaladoresFolder$adobeAIR" \
    )\
    (echo "Já existe instalação do $adobeAIR, pulando instalação")\
    (echo "Erro inesperado ao verificar instalação do $adobeAIR")

# Instalar SisBR
verificaNaoExisteArquivo "$wineFolder""drive_c/Sisbr 2.0/Sisbr 2.0.exe" \
    (\
        echo "Instalando $SisBr" \
        sudo WINEPREFIX="$wineFolder" wine "$instaladoresFolder$SisBr" \
    )\
    (echo "Já existe instalação do $SisBr, pulando instalação")\
    (echo "Erro inesperado ao verificar instalação do $SisBr")

#! Copiar .desktop
echo "Copiando arquivo .desktop"
sudo cp ./desktop/Sisbr_2.0.desktop /usr/share/applications/

# Copiar icones para o sistema
echo "Inserindo icones do programa no sistema"
sudo cp -r ./desktop/hicolor/* /usr/share/icons/hicolor/

# Permissão para todos editarem
echo "fornecendo permissões para todos usarem a pasta do SisBR"
sudo chmod 777 -R /opt/sicoob/wine/drive_c/Sisbr\ 2.0/
sleep 30 ; sudo chmod 777 -R /opt/sicoob/wine/drive_c/Sisbr\ 2.0/ &
echo "Assim que o SisBR tiver atualizado, por favor dar sim para dar as permissões novamente"
sim_nao;if [ "$sim_ou_nao" == "nao" ];then
    unset sim_ou_nao; echo "Não? Será aplicado mesmo assim :P"
fi
sudo chmod 777 -R /opt/sicoob/wine/drive_c/Sisbr\ 2.0/


# SisBR irá atualizar e rodar automáticamente

