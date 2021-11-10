#!/bin/bash
# Código feito por Jumper Luko <jumper.luko@gmail.com>

# Carimbar arquivo de log
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
echo -e "\n\nInstalador: $timestamp" >> $HOME/Downloads/SicoobInstalado.log

scriptsDir=./scripts

# Fornecendo permissão de executar em todos sh
chmod +x $scriptsDir/*.sh

echo -e "\nBem vindo ao Sicoob Instala\n\n" 
echo -e "Digite o numero da opção que deseja\n"

echo "0- Realizar todas operações abaixo"
echo "1- Instalar pacotes e configurar o basico no PC (IMPORTANTE)"
echo "2- Configurar AD"
echo "3- Instalar SisBR"
echo "4- Instalar Gercoop"
echo "5- Configurar VNC"
echo "6- Instalar Caixa (+java i586)"
echo "7- Instalar Sicoob Empresarial (falta atalho para o usuário abrir)"

echo ""
read -p "Digite o numero da opção que deseja: " opcao

while true; do
    case $opcao in
        0) 
            $scriptsDir/01-basicsPackages_OS+basicConfig.sh
            $scriptsDir/1-configAD.sh
            $scriptsDir/3-SisBr-all.sh
            $scriptsDir/3-Gercoop-system-install.sh
            $scriptsDir/2-vnc-system-install.sh
            $scriptsDir/4-Caixa-install.sh
            break;;
        1) 
            $scriptsDir/01-basicsPackages_OS+basicConfig.sh
            break;;
        2)
            $scriptsDir/1-configAD.sh
            break;;
        3)
            $scriptsDir/3-SisBr-all.sh
            break;;
    	4)
            $scriptsDir/3-Gercoop-system-install.sh
            break;;
        5)
            $scriptsDir/2-vnc-system-install.sh
            break;;
        6)
            $scriptsDir/4-Caixa-install.sh
            break;;
        7)
            $scriptsDir/4-SicoobEmpresarial-install.sh
            break;;
        "sair"|"exit")
            echo "saindo"
            break;;
        *) 
            read -p "Por favor digite um número válido: " opcao;;
    esac
done

echo -e "\n\n======  ======  ======  ====== ======"
echo -e " Aperte enter para sair do programa"
echo -e "======  ======  ======  ====== ======"

read