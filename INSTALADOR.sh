#!/bin/bash

# Fornecendo permissão de executar em todos sh
chmod +x ./*.sh

printf "Bem vindo ao Sistema de compatibilidade e configuração automátizado de sistema Linux para Sicoob\n\n"
printf "Digite o numero da opção que deseja\n"

echo "0- Realizar todas operações comuns na sequencia (1,2,3,4)"
echo "1- Instalar pacotes e configurar o o basico no PC (IMPORTANTE)"
echo "2- Configurar AD"
echo "3- Instalar SisBR"
echo "4- Instalar Gercoop (em testes)"

read -p "Digite o numero da opção que deseja: " opcao

while true; do
    case $opcao in
        0) 
            ./01-basicsPackages_OS+basicConfig.sh
            ./1-configAD.sh
            ./3-SisBr-all.sh
            ./3-Gercoop-system-install.sh
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
        "sair")
            echo "saindo"
            break;;
        *) 
            read -p "Por favor digite um número válido: " opcao;;
    esac
done
