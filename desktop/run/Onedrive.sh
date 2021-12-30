#!/bin/bash

TextoOpcoes(){ 
    echo -e "\e[1;44m=== Onedrive ===\e[0m\n"

    echo -e "0- Para sair do programa"
    echo -e "1- Logar no Onedrive"
    echo -e "2- Deslogar do Onedrive"
    echo -e "3- Executar Onedrive"
    echo -e "4- Habilitar Onedrive na inicialização"
    echo -e "5- Desabilitar Onedrive na inicialização"
    echo -e "6- Configurar Onedrive"

    read -p "Digite o numero da opção que deseja: " opcao
}
TextoOpcoes

while true; do
    case $opcao in
        0)
            echo -e "\nSaindo\n"
            break;;
        1) 
            onedrive
            echo "Ativado"
            ;;
        2)
            onedrive --logout
            echo "Deslogado"
            ;;
        3)
            systemctl --user start onedrive
            echo "Rodando"
            ;;
        4)
            systemctl --user enable onedrive
            echo "Ativado"
            ;;
    	5)
            systemctl --user disable onedrive
            echo "Desativado"
            ;;
        6)
            # Copiar arquivo de configuração padrão, se não existir
            if ! [ -e "$HOME/.config/onedrive/config" ]; then 
                cp /usr/share/doc/onedrive/config ~/.config/onedrive/config
            fi
            nano ~/.config/onedrive/config
            ;;
        *) 
            read -p "Por favor digite um número válido: " opcao;;
    esac
    unset opcao
    TextoOpcoes
done

# read -p "Aperte enter para finalizar"