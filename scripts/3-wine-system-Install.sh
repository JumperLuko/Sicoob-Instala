#!/bin/bash

# Carimbar arquivo de log
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
echo "wine-system-install: $timestamp" >> $HOME/Downloads/SicoobInstalado.log

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

# Diretórios
sicoobFolder="/opt/sicoob/"
wineFolder="/opt/sicoob/wine/"
instaladoresFolder="/opt/sicoob/instaladores/"
runFolder="/opt/sicoob/run/"
instaladoresLocal="$relativeDir/instaladores/"

# Criando diretórios
echo "Gerando pastas"
sudo mkdir "$sicoobFolder" 2>> $HOME/Downloads/SicoobInstalado.log
sudo mkdir "$wineFolder" 2>> $HOME/Downloads/SicoobInstalado.log
sudo mkdir "$instaladoresFolder" 2>> $HOME/Downloads/SicoobInstalado.log
sudo mkdir "$runFolder" 2>> $HOME/Downloads/SicoobInstalado.log

# Gerando diretórios do wine
echo "Gerando diretórios do wine em $wineFolder"
sudo WINEPREFIX="$wineFolder" wine wineboot 2>> $HOME/Downloads/SicoobInstalado.log

# Verificando se existe o arquivo do instalador na pasta local ou no sistema
verificaInstalador(){
    var1=$1
    copia_instalador() {
        echo "copiando instalador $var1 da pasta 'instaladores' para o sistema"
        sudo cp "$relativeDir/instaladores/$var1" "$instaladoresFolder"
        sudo chmod 755 "$instaladoresFolder$var1"
    }
    erro_arquivos() {
        echo "Falha inesperada ao verificar arquivos do $var1"
        echo "O script continuará em 10 segundos"
        sleep 10
    }
    
    if [ -e "$instaladoresLocal" ] && ! [ -e "$instaladoresFolder$1" ]; then
        copia_instalador
    elif [ -e "$instaladoresLocal" ] && [ -e "$instaladoresFolder$1" ]; then
        echo "Instalador $1 já existe em $instaladoresFolder, deseja sobrescrever?"
        sim_nao;if [ "$sim_ou_nao" == "sim" ];then
            copia_instalador
        fi;
    elif ! [ -e "$instaladoresLocal" ] && [ -e "$instaladoresFolder$1" ]; then
        echo -e "\n\nNão existe instalador com nome $1 na pasta 'instaladores', porém existe no sistema e será usada esta"
    elif ! [ -e "$instaladoresLocal" ] && ! [ -e "$instaladoresFolder$1" ]; then
        echo "não existe instaladores do $1 na pasta 'instaladores', por favor jogue um arquivo nessa pasta com nome $1 e digite sim"
        while ! [ -e "$instaladoresLocal" ]; do
            sim_nao_canc_echo;if [ "$sim_ou_nao" == "sim" ];then
                if [ -e "$instaladoresLocal" ];then
                    copia_instalador
                elif ! [ -e "$instaladoresLocal" ];then
                    echo "Instalador não encontrado, tente novamente por arquivo com nome $1"
                else
                    erro_arquivos
                fi
            fi;
        done
    else
        erro_arquivos
    fi
    unset var1
}

# Verifica se ta instalado e se não, então instala
verificaInstalaWine(){
    if ! [ -e "$wineFolder""$1" ]; then
        echo "Instalando $2" ;
        sudo WINEPREFIX="$wineFolder" wine "$instaladoresFolder$2" 2>> $HOME/Downloads/SicoobInstalado.log
    elif [ -e "$wineFolder""$1" ]; then
        echo -e "\nJá existe instalação do $2, cancelar instalação?"
        sim_nao;if [ "$sim_ou_nao" == "nao" ]; then
            sudo WINEPREFIX="$wineFolder" wine "$instaladoresFolder$2" 2>> $HOME/Downloads/SicoobInstalado.log
        fi;
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
        echo "Não? Será aplicado mesmo assim :P"
    fi;
    sudo chmod 777 -R "$1"
}