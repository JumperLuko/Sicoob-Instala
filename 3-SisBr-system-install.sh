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
adobeAIR=AdobeAIRInstaller.exe
SisBr=Sisbr20.exe

# Verificando se existe o arquivo do adobeAIR na pasta local
if [ -e $adobeAIR ] && ! [ -e /opt/wine/instaladores/$adobeAIR ]; then
	echo "copiando instalador AdobeAir para pasta de instaladores"
	sudo cp $adobeAIR /opt/wine/instaladores/
	sudo chmod 755 /opt/wine/instaladores/$adobeAIR
elif [ -e $adobeAIR ] && [ -e /opt/wine/instaladores/$adobeAIR ]; then
    echo "Instalador $adobeAIR já existe em /opt/wine/instaladores/, deseja sobrescrever?"
    adobeAIRSobrescrever(){
        sim_nao;if [ "$sim_ou_nao" == "nao" ];then
            unset sim_ou_nao;return
        fi
        echo "copiando instalador AdobeAir para pasta de instaladores"
        sudo cp $adobeAIR /opt/wine/instaladores/
        sudo chmod 755 /opt/wine/instaladores/$adobeAIR
    }
    adobeAIRSobrescrever
elif ! [ -e $adobeAIR ] && [ -e /opt/wine/instaladores/$adobeAIR ]; then
    echo "Não existe instalador com nome $adobeAIR nesta pasta, porém existe no sistema e será usada esta"
    echo "deseja continuar?"
    sim_nao;if [ "$sim_ou_nao" == "nao" ];then
        unset sim_ou_nao;exit
    fi
elif ! [ -e $adobeAIR ] && [ -e /opt/wine/instaladores/$adobeAIR ]; then
    echo "não existe instaladores do adobeAIR, por favor jogue um arquivo nesta pasta com nome $adobeAIR"
    echo "este arquivo encerrará a execução"
    sleep 5
    exit
else
    echo "Falha inesperada ao verificar arquivos do adobeAIR"
    echo "O script continuará em 15 segundos"
    sleep 15
fi

# Verificando se existe o arquivo do SisBr na pasta local
if [ -e $SisBr ] && ! [ -e /opt/wine/instaladores/$SisBr ]; then
	echo "copiando instalador SisBr para pasta de instaladores"
	sudo cp $SisBr /opt/wine/instaladores/
	sudo chmod 755 /opt/wine/instaladores/$SisBr
elif [ -e $SisBr ] && [ -e /opt/wine/instaladores/$SisBr ]; then
    echo "Instalador $SisBr já existe em /opt/wine/instaladores/, deseja sobrescrever?"
    SisBrSobrescrever(){
        sim_nao;if [ "$sim_ou_nao" == "nao" ];then
            unset sim_ou_nao;return
        fi
        echo "copiando instalador SisBr para pasta de instaladores"
        sudo cp $SisBr /opt/wine/instaladores/
        sudo chmod 755 /opt/wine/instaladores/$SisBr
    }
    SisBrSobrescrever
elif ! [ -e $SisBr ] && [ -e /opt/wine/instaladores/$SisBr ]; then
    echo "Não existe instalador com nome $SisBr nesta pasta, porém existe no sistema e será usada esta"
    echo "deseja continuar?"
    sim_nao;if [ "$sim_ou_nao" == "nao" ];then
        unset sim_ou_nao;exit
    fi
elif ! [ -e $SisBr ] && [ -e /opt/wine/instaladores/$SisBr ]; then
    echo "não existe instaladores do SisBr, por favor jogue um arquivo nesta pasta com nome $SisBr"
    echo "este arquivo encerrará a execução"
    sleep 5
    exit
else
    echo "Falha inesperada ao verificar arquivos do SisBr"
    echo "O script continuará em 15 segundos"
    sleep 15
fi


# Instalar AdobeAir na pasta do sistema (precaução)
if ! [ -e "/opt/wine/drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" ]; then
    echo "Instalando AdobeAIR"
    sudo WINEPREFIX=/opt/wine/ wine /opt/wine/instaladores/AdobeAIRInstaller.exe
elif [ -e "/opt/wine/drive_c/Program Files (x86)/Adobe/Flash Player/AddIns/airappinstaller/airappinstaller.exe" ]; then
    echo "Já existe instalação do AdobeAIR, pulando instalação"
else
    echo "Erro inesperado ao verificar instalação do AdobeAIR"
fi


# Instalar SisBR
if ! [ -e "/opt/wine/drive_c/Sisbr 2.0/Sisbr 2.0.exe" ]; then
    echo "Instalando SisBR"
    sudo WINEPREFIX=/opt/wine/ wine /opt/wine/instaladores/Sisbr20.exe
elif [ -e "/opt/wine/drive_c/Sisbr 2.0/Sisbr 2.0.exe" ]; then
    echo "Já existe instalação do SisBR, pulando instalação"
else
    echo "Erro inesperado ao verificar instalação do SisBR"
fi

#! Copiar .desktop
echo "Copiando arquivo .desktop"
sudo cp ./desktop/Sisbr_2.0.desktop /usr/share/applications/

# Copiar icones para o sistema
echo "Inserindo icones do programa no sistema"
sudo cp ./desktop/hicolor/* /usr/share/icons/hicolor/

# Permissão para todos editarem
echo "fornecendo permissões para todos usarem a pasta od SisBR"
sudo chmod 777 -R /opt/wine/drive_c/Sisbr\ 2.0/
echo "Assim que o SisBR tiver atualizado, por favor dar sim para dar as permissões novamente"
sim_nao;if [ "$sim_ou_nao" == "nao" ];then
    echo "Não? Será aplicado mesmo assim :P";unset sim_ou_nao
fi
sudo chmod 777 -R /opt/wine/drive_c/Sisbr\ 2.0/

# SisBR irá atualizar e rodar automáticamente

