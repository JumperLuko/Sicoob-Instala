#!/bin/bash

# Carimbar arquivo de log
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
echo "Copia-Instaladores: $timestamp" >> $HOME/Downloads/SicoobInstala.log

# Verificar caminhos das dependencias
if [ "$scriptsDir" == "" ] && [ -e "./scripts/" ];then
    scriptsDir=./scripts
    relativeDir=.
elif [ "$scriptsDir" == "" ];then
    scriptsDir=.
    relativeDir=..
fi

# Dependendencias
source $scriptsDir/_GeneralFunctions.sh

echo -e "\nCopiando todos os arquivos de instaladores existentes para o sistema"

# Diretórios
sicoobFolder="/opt/sicoob/"
instaladoresFolder="/opt/sicoob/instaladores/"
instaladoresLocal="$relativeDir/instaladores/"

# Criando diretórios
echo "Gerando pastas"
sudo mkdir "$sicoobFolder" 2>> $HOME/Downloads/SicoobInstala.log
sudo mkdir "$instaladoresFolder" 2>> $HOME/Downloads/SicoobInstala.log

# Gerando diretórios do wine
echo "Gerando diretórios do wine em $wineFolder"
sudo WINEPREFIX="$wineFolder" wine wineboot 2>> $HOME/Downloads/SicoobInstala.log
# sudo WINEPREFIX="$wine32Folder" WINEARCH="win32" wineboot>> $HOME/Downloads/SicoobInstala.log

# Verificando se existe o arquivo do instalador na pasta local ou no sistema
verificaInstalador(){
    var1=$1
    copia_instalador() {
        echo "copiando instalador $var1 da pasta 'instaladores' para o sistema"
        sudo cp "$relativeDir/instaladores/$var1" "$instaladoresFolder"
        sudo chmod 755 "$instaladoresFolder$var1"
    }
    erro_arquivos() {
        echo -e "\e[31mFalha inesperada ao verificar arquivos do $var1\e[0m"
        echo -e "\e[1;31mO script continuará em 10 segundos\e[0m"
        sleep 10
    }
    
    if [ -e "$instaladoresLocal$1" ] && ! [ -e "$instaladoresFolder$1" ]; then
        copia_instalador
    elif [ -e "$instaladoresLocal$1" ] && [ -e "$instaladoresFolder$1" ]; then
        echo "Instalador $1 já existe em $instaladoresFolder, deseja sobrescrever?"
        sim_nao;if [ "$sim_ou_nao" == "sim" ];then
            copia_instalador
        fi;
    elif ! [ -e "$instaladoresLocal$1" ] && [ -e "$instaladoresFolder$1" ]; then
        echo -e "\n\nNão existe instalador com nome $1 na pasta 'instaladores', porém existe no sistema e será usada esta"
    elif ! [ -e "$instaladoresLocal$1" ] && ! [ -e "$instaladoresFolder$1" ]; then
        echo -e "\e[31mnão existe instaladores do $1 na pasta 'instaladores', por favor jogue um arquivo nessa pasta com nome\e[0m\e[1;31m $1 e digite sim\e[0m"
    else
        erro_arquivos
    fi
    unset var1
}

verificaInstalador "AdobeAIRInstaller.exe"
verificaInstalador "Sisbr20.exe"
verificaInstalador "Gercoop.exe"
verificaInstalador "Instalador-agger.exe"
verificaInstalador "NDP452-KB2901907-x86-x64-AllOS-PTB.exe"