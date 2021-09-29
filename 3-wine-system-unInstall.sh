#!/bin/bash

# Dependendencias
source ./_GeneralFunctions.sh

# Diretórios
sicoobFolder="/opt/sicoob/"
wineFolder="/opt/sicoob/wine/"
instaladoresFolder="/opt/sicoob/instaladores/"
runFolder="/opt/sicoob/run/"

# Criando diretórios
sudo mkdir "$sicoobFolder"
sudo mkdir "$wineFolder"
sudo mkdir "$instaladoresFolder"
sudo mkdir "$runFolder"

# Gerando diretórios do wine
echo "Gerando diretórios do wine em $wineFolder"
sudo WINEPREFIX="$wineFolder" wine wineboot

# Verificando se existe o arquivo do instalador na pasta local ou no sistema
verificaInstalador(){
    if [ -e "$1" ] && ! [ -e "$instaladoresFolder$1" ]; then
        echo "copiando instalador $1 para pasta de instaladores"
        sudo cp "$1" "$instaladoresFolder"
        sudo chmod 755 "$instaladoresFolder$1"
    elif [ -e "$1" ] && [ -e "$instaladoresFolder$1" ]; then
        echo "Instalador $1 já existe em $instaladoresFolder, deseja sobrescrever?"
        sim_nao;if [ "$sim_ou_nao" == "sim" ];then
            echo "copiando instalador $1 para pasta de instaladores"
            sudo cp "$1" "$instaladoresFolder"
            sudo chmod 755 "$instaladoresFolder$1"
        fi
    elif ! [ -e "$1" ] && [ -e "$instaladoresFolder$1" ]; then
        echo "Não existe instalador com nome $1 nesta pasta, porém existe no sistema e será usada esta"
        echo "deseja continuar?"
        sim_nao;if [ "$sim_ou_nao" == "nao" ];then exit; fi
    elif ! [ -e "$1" ] && ! [ -e "$instaladoresFolder$1" ]; then
        echo "não existe instaladores do $1, por favor jogue um arquivo nesta pasta com nome $1"
        echo "este arquivo encerrará a execução"
        sleep 5
        exit
    else
        echo "Falha inesperada ao verificar arquivos do $1"
        echo "O script continuará em 15 segundos"
        sleep 15
    fi
}

# Verifica se ta instalado e se não, então instala
verificaInstalaWine(){
    if ! [ -e "$wineFolder""$1" ]; then
        echo "Instalando $2" ;
        sudo WINEPREFIX="$wineFolder" wine uninstaller
    elif [ -e "$wineFolder""$1" ]; then
        echo "Já existe instalação do $2, pulando instalação"
    else
        echo "Erro inesperado ao verificar instalação do $2"
    fi
}

# Permissão para todos editarem
addPerm777(){
    echo "fornecendo permissões para todos usarem a pasta do $2"
    sudo chmod 777 -R "$1"
    (sleep 30 ; sudo chmod 777 -R "$1") &
    echo "Assim que o $2 tiver atualizado, por favor dar sim para dar as permissões novamente"
    sim_nao;if [ "$sim_ou_nao" == "nao" ];then
        unset sim_ou_nao; echo "Não? Será aplicado mesmo assim :P"
    fi
    sudo chmod 777 -R /opt/sicoob/wine/drive_c/Sisbr\ 2.0/
}