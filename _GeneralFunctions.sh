#!/bin/bash

# Mostrar sim ou não para funções
sim_nao() {
    unset sim_ou_nao;
    while true; do
        read -p "$* [s/n]: " sn
        case $sn in
            [Ss]*) sim_ou_no="sim" && return 0  ;;  
            [Nn]*) printf "Não\n\n" ; sim_ou_nao="nao" && return  1 ;;
        esac
        sim_ou_no="null"
    done
}

sim_nao_echo() {
    echo "S para Sim"
    echo "N para Negar instalação"
    echo "C para Cancelar e sair deste programa"
}

sim_nao_echo_editar() {
    echo "S para Sim, $1"
    echo "N para Negar, $2"
    echo "C para Cancelar, $3"
}