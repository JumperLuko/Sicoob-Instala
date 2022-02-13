#!/bin/bash

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

# Carimbar arquivo de log
timestamp "wine-system-install: "

# Criando diretórios
echo "Gerando pastas"
mkdir-if $sicoobFolder
mkdir-if $wineFolder
mkdir-if $instaladoresFolder
mkdir-if $runFolder
# if ! [ -e "$wine32Folder" ]; then          sudo mkdir "$wine32Folder";  fi 

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
        while ! [ -e "$instaladoresLocal$1" ]; do
            sim_nao_canc_echo;if [ "$sim_ou_nao" == "sim" ];then
                if [ -e "$instaladoresLocal$1" ];then
                    copia_instalador
                elif ! [ -e "$instaladoresLocal$1" ];then
                    echo -e "\e[31mInstalador não encontrado, tente novamente por arquivo com nome\e[0m \e[1;31m$1\e[0m"
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

# verificaInstalaWine32(){
#     if ! [ -e "$wine32Folder""$1" ]; then
#         echo "Instalando $2" ;
#         sudo WINEPREFIX="$wine32Folder" wine "$instaladoresFolder$2" 2>> $HOME/Downloads/SicoobInstalado.log
#     elif [ -e "$wine32Folder""$1" ]; then
#         echo -e "\nJá existe instalação do $2, cancelar instalação?"
#         sim_nao;if [ "$sim_ou_nao" == "nao" ]; then
#             sudo WINEPREFIX="$wine32Folder" wine "$instaladoresFolder$2" 2>> $HOME/Downloads/SicoobInstalado.log
#         fi;
#     else
#         echo "Erro inesperado ao verificar instalação do $2"
#     fi
# }

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