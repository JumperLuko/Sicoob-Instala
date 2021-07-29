#!/bin/bash

# Mostrar sim ou não para funções
sim_nao() {
    unset sim_ou_nao;
    while true; do
        read -p "$* [s/n]: " sn
        case $sn in
            [Ss]*) sim_ou_no="sim" && return 0  ;;  
            [Nn]*) printf "Cancelado\n\n" ; sim_ou_nao="nao" && return  1 ;;
        esac
        sim_ou_no="null"
    done
}

# Verifica se há arquivo e executa
verificaExisteArquivo(){
    if [ -e "$1" ]; then
        $2
    elif ! [ -e "$1" ]; then
        $3
    else
        $4
    fi
}

# Verifica se não há arquivo e executa
verificaNaoExisteArquivo(){
    if ! [ -e "$1" ]; then
        $2
    elif [ -e "$1" ]; then
        $3
    else
        $4
    fi
}
