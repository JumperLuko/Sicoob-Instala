#!/bin/bash

#| Mostrar sim ou não para funções
sim_nao() {
    while true; do
        read -p "$* [s/n]: " sn
        case $sn in
            [Ss]*) sim_ou_no="sim" && return 0  ;;  
            [Nn]*) printf "Cancelado\n\n" ; sim_ou_nao="nao" && return  1 ;;
        esac
        sim_ou_no="null"
    done
}

# Local onde ficará os programas e instaladores
echo "Criando pasta do wine e instaladores"
sudo mkdir /opt/wine/
sudo mkdir /opt/wine/instaladores/

# Gerando firetórios do wine
echo "Gerando diretórios do wine em /opt/wine/"
sudo WINEPREFIX=/opt/wine/ wine wineboot

# copiar instalador para /opt/wine/instaladores/
Gercoop=Gercoop.exe

#! Verificar se há conexão com o servidor, pois a é necessário para instalação

# Verificando se existe o arquivo do Gercoop na pasta local
if [ -e $Gercoop ] && ! [ -e /opt/wine/instaladores/$Gercoop ]; then
	echo "copiando instalador Gercoop para pasta de instaladores"
	sudo cp $Gercoop /opt/wine/instaladores/
	sudo chmod 755 /opt/wine/instaladores/$Gercoop
elif [ -e $Gercoop ] && [ -e /opt/wine/instaladores/$Gercoop ]; then
    echo "Instalador $Gercoop já existe em /opt/wine/instaladores/, deseja sobrescrever?"
    GercoopSobrescrever(){
        sim_nao;if [ "$sim_ou_nao" == "nao" ];then
            unset sim_ou_nao;return
        fi
        echo "copiando instalador Gercoop para pasta de instaladores"
        sudo cp $Gercoop /opt/wine/instaladores/
        sudo chmod 755 /opt/wine/instaladores/$Gercoop
    }
    GercoopSobrescrever
elif ! [ -e $Gercoop ] && [ -e /opt/wine/instaladores/$Gercoop ]; then
    echo "Não existe instalador com nome $Gercoop nesta pasta, porém existe no sistema e será usada esta"
    echo "deseja continuar?"
    sim_nao;if [ "$sim_ou_nao" == "nao" ];then
        unset sim_ou_nao;exit
    fi
elif ! [ -e $Gercoop ] && ! [ -e /opt/wine/instaladores/$Gercoop ]; then
    echo "não existe instaladores do Gercoop, por favor jogue um arquivo nesta pasta com nome $Gercoop"
    echo "este arquivo encerrará a execução"
    sleep 5
    exit
else
    echo "Falha inesperada ao verificar arquivos do Gercoop"
    echo "O script continuará em 15 segundos"
    sleep 15
fi

# Instalar Gercoop
if ! [ -e "/opt/wine/drive_c/GerCoop/GerCoop.exe" ]; then
    echo "Instalando Gercoop"
    sudo WINEPREFIX=/opt/wine/ wine /opt/wine/instaladores/$Gercoop
elif [ -e "/opt/wine/drive_c/GerCoop/GerCoop.exe" ]; then
    echo "Já existe instalação do Gercoop, pulando instalação"
else
    echo "Erro inesperado ao verificar instalação do Gercoop"
fi

#! Copiar .desktop
echo "Copiando arquivo .desktop"
sudo cp ./desktop/GerCoop.desktop /usr/share/applications/

# Copiar icones para o sistema
echo "Inserindo icones do programa no sistema"
sudo cp -r ./desktop/hicolor/* /usr/share/icons/hicolor/

# Permissão para todos editarem
echo "fornecendo permissões para todos usarem a pasta do Gercoop"
sudo chmod 777 -R /opt/wine/drive_c/GerCoop/

# Atualizando Gercoop
#! Preciso arranjar forma de criar uma caminho para rodar o gercoop (cd sem usar terminal, pelo .desktop), para ele não gerar arquivos de monte onde for rodar
#echo "Assim que o Gercoop tiver atualizado, por favor dar sim para dar as permissões novamente"
echo "Por favor não atualizar, vai gerar arquivos locais"
sudo WINEPREFIX=/opt/wine/ wine /opt/wine/drive_c/GerCoop/GerCoop.exe 
sim_nao;if [ "$sim_ou_nao" == "nao" ];then
    unset sim_ou_nao; echo "Não? Será aplicado mesmo assim :P"
fi
sudo chmod 777 -R /opt/wine/drive_c/GerCoop/

