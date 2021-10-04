#!/bin/bash

# Mostrar sim ou não para funções
sim_nao() {
    unset sim_ou_nao;
    while true; do
        read -p "$* [s/n]: " sn
        case $sn in
            [Ss]*) sim_ou_nao="sim" && return 0 ;;  
            [Nn]*) sim_ou_nao="nao" && return 1 ;;
        esac
        sim_ou_no="null"
    done
}

sim_nao-echo() {
    echo "S para Sim"
    echo "N para Negar instalação"
}

sim_nao-echo_editar() {
    echo "S para Sim, $1"
    echo "N para Negar, $2"
}

sim_nao_echo() {
    sim_nao-echo; sim_nao
}

sim_nao_echo_editar() {
    sim_nao-echo_editar; sim_nao
}

# Mostrar sim ou não ou cancelar para funções
sim_nao_canc() {
    unset sim_ou_nao;
    while true; do
        read -p "$* [s/n/c]: " snc
        case $snc in
            [Ss]*) sim_ou_nao="sim" && return 0 ;;  
            [Nn]*) sim_ou_nao="nao" && return 1 ;;
            [Cc]*) sim_ou_nao="cancelar" && exit ;;
        esac
        sim_ou_no="null"
    done
}

sim_nao_canc-echo() {
    echo "S para Sim"
    echo "N para Negar instalação"
    echo "C para Cancelar e sair deste programa"
}

sim_nao_canc-echo_editar() {
    echo "S para Sim, $1"
    echo "N para Negar, $2"
    echo "C para Cancelar, $3"
}

sim_nao_canc_echo() {
    sim_nao_canc-echo; sim_nao_canc
}

sim_nao_canc_echo_editar() {
    sim_nao_canc-echo_editar; sim_nao_canc
}