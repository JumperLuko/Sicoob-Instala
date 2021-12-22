#!/bin/bash
# Código feito por Jumper Luko <jumper.luko@gmail.com>

# Carimbar arquivo de log
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
echo -e "\n\nInstalador: $timestamp" >> $HOME/Downloads/SicoobInstalado.log

scriptsDir=./scripts

# Fornecendo permissão de executar em todos sh
chmod +x $scriptsDir/*.sh

echo -e "\nBem vindo ao \e[1;32mSicoob Instala\e[0m" 
echo -e "Para sistemas baseados no Ubuntu Focal (20.04)\n\n"
echo -e "\e[44m------  ------  ------ ------\e[0m"
echo -e "\e[1;44m     Instalar Programas      \e[0m"
echo -e "\e[44m------  ------  ------ ------\e[0m\n"

echo -e "\e[34m0\e[0m -  Realizar todas operações abaixo"
echo -e "\e[34m1\e[0m -  Instalar pacotes e configurar o basico no PC (IMPORTANTE)"
echo -e "\e[34m2\e[0m -  Instalar pacotes de repositórios externos (Chrome, Teams, Anydesk, Teamviewer, OnlyOffice, Zoom)"
echo -e "\e[34m3\e[0m -  Configurar AD"
echo -e "\e[34m4\e[0m -  Instalar SisBR"
echo -e "\e[34m5\e[0m -  Instalar Gercoop"
echo -e "\e[34m6\e[0m -  Configurar VNC"
echo -e "\e[34m7\e[0m -  Instalar Caixa (+java i586)"
echo -e "\e[34m8\e[0m -  Instalar Sicoob Empresarial (instalação dentro do usuário)"
echo -e "\e[34m9\e[0m -  Alterar nome da maquina"
echo -e "\e[34m10\e[0m - Configurar Onedrive (Melhorias a serem feitas)"
echo -e "\e[34m99\e[0m - Desinstalar Programas"

echo ""
read -p "Digite o numero da opção que deseja: " opcao

while true; do
    case $opcao in
        0) 
            $scriptsDir/014-basicsPackages_OS+basicConfig.sh
            $scriptsDir/1-configAD.sh
            $scriptsDir/3-SisBr-all.sh
            $scriptsDir/3-Gercoop-system-install.sh
            $scriptsDir/2-vnc-system-install.sh
            $scriptsDir/4-Caixa-install.sh
            $scriptsDir/4-SicoobEmpresarial-install.sh
            break;;
        1) 
            $scriptsDir/014-basicsPackages_OS+basicConfig.sh
            break;;
        2)
            $scriptsDir/0-repositoryPrograms-install.sh
            break;;
        3)
            $scriptsDir/1-configAD.sh
            break;;
        4)
            $scriptsDir/3-SisBr-all.sh
            break;;
    	5)
            $scriptsDir/3-Gercoop-system-install.sh
            break;;
        6)
            $scriptsDir/2-vnc-system-install.sh
            break;;
        7)
            $scriptsDir/4-Caixa-install.sh
            break;;
        8)
            $scriptsDir/4-SicoobEmpresarial-install.sh
            break;;
        9)
            $scriptsDir/1-hostname.sh
            break;;
        10)
            $scriptsDir/4-onedrive-config.sh
            break;;
        99)
            unset opcao
            echo -e "\n\n\e[44m------  ------  ------ ------\e[0m"
            echo -e "\e[1;44m    Desinstalar Programas    \e[0m"
            echo -e "\e[44m------  ------  ------ ------\e[0m\n"

            echo -e "\e[34m1\e[0m -  Desinstalar programas em 'wine' (Sisbr)"
            echo -e "\e[34m2\e[0m -  Remover pasta 'wine' (programas de Windows)"
            echo -e "\e[34m3\e[0m -  remover pasta '/opt/sicoob' (Sisbr)"

            echo ""
            read -p "Digite o numero da opção que deseja: " opcao
            while true; do
                case $opcao in
                1)
                    $scriptsDir/3-wine-system-uninstall.sh
                    break;;
                2)
                    $scriptsDir/3-wineFolder-remove.sh
                    break;;
                3)
                    $scriptsDir/234-SicoobFolder-remove.sh
                    break;;
                "sair"|"exit")
                    echo "saindo"
                    break;;
                *)
                    read -p "Por favor digite um número válido: " opcao;;
                esac
            done
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