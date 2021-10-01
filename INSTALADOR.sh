#!/bin/bash
# Código feito por Jumper Luko <jumper.luko@gmail.com>

timestamp=$(date +%Y-%m-%d_%H-%M-%S)
echo "Instalador: $timestamp" >> $HOME/Downloads/SicoobInstalado.log

# Fornecendo permissão de executar em todos sh
chmod +x ./*.sh

echo -e "Bem vindo ao Sicoob Instala\n\n" 
echo -e "Digite o numero da opção que deseja\n"

echo "0- Realizar todas operações abaixo"
echo "1- Instalar pacotes e configurar o basico no PC (IMPORTANTE)"
echo "2- Configurar AD"
echo "3- Instalar SisBR"
echo "4- Instalar Gercoop"
echo "5- Configurar VNC"
echo "6- Caixa"

echo ""
read -p "Digite o numero da opção que deseja: " opcao

while true; do
    case $opcao in
        0) 
            ./01-basicsPackages_OS+basicConfig.sh
            ./1-configAD.sh
            ./3-SisBr-all.sh
            ./3-Gercoop-system-install.sh
            ./2-vnc-system-install.sh
            ./3-Caixa.sh
            break;;
        1) 
            ./01-basicsPackages_OS+basicConfig.sh
            break;;
        2)
            ./1-configAD.sh
            break;;
        3)
            ./3-SisBr-all.sh
            break;;
    	4)
            ./3-Gercoop-system-install.sh
            break;;
        5)
            ./2-vnc-system-install.sh
            break;;
        6)
            ./3-Caixa.sh
            break;;
        "sair")
            echo "saindo"
            break;;
        *) 
            read -p "Por favor digite um número válido: " opcao;;
    esac
done
