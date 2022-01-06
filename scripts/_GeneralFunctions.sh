#!/bin/bash

timestamp () {
    # Carimbar arquivo de log
    timestampNow=$(date +%Y-%m-%d_%H-%M-%S)
    echo "$1 $timestampNow" >> $HOME/Downloads/SicoobInstala.log
}

# Mostrar sim ou não para funções
sim_nao() {
    unset sim_ou_nao;
    while true; do
        read -p "$* [s/n]: " sn
        case $sn in
            [Ss]*) sim_ou_nao="sim" && return 0 ;;  
            [Nn]*) sim_ou_nao="nao" && return 1 ;;
        esac
        sim_ou_nao="null"
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
        sim_ou_nao="null"
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

encerra_execucao() {
    echo "este programa encerrará a execução"
    sleep 5
    exit
}

# reboot?
reiniciar() {
    echo -e "\nDeseja \e[34mreiniciar\e[0m?"
    echo "$1"
    sim_nao;if [ "$sim_ou_nao" == "sim" ];then
        echo "Reiniciando...";reboot
    elif [ "$sim_ou_nao" == "nao" ];then
        echo "Sem reboot"
    fi
}

# Diretórios
sicoobFolder="/opt/sicoob/"
wineFolder="/opt/sicoob/wine/"
# wine32Folder="/opt/sicoob/wine32/"
instaladoresFolder="/opt/sicoob/instaladores/"
runFolder="/opt/sicoob/run/"
instaladoresLocal="$relativeDir/instaladores/"

# Criando diretórios
echo "Cria pasta se não existir"
mkdir-if() {
    if ! [ -e "$1" ]; then
        sudo mkdir "$1"
    fi
}

ln-if{
    if [ -e "$1" ] && ! [ -e "$2" ]; then
        sudo ln -s $1 $2
    fi
}