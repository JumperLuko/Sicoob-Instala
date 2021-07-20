#!/bin/bash

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
sim_nao;if [ "$sim_ou_nao" == "nao" ];then
    echo "Não? Será aplicado mesmo assim :P";unset sim_ou_nao
	echo $sim_ou_nao
fi

# #| Mostrar sim ou não
# sim_nao() {
#     while true; do
#         read -p "$* [s/n]: " sn
#         case $sn in
#             [Ss]*) sim_ou_no="sim" && return 0  ;;  
#             [Nn]*) printf "Cancelado\n\n" ; sim_ou_nao="nao" && return  1 ;;
#         esac
#         sim_ou_no="null"
#     done
# }

# funcao1(){
# 	sim_nao;if [ "$sim_ou_nao" == "nao" ];then
#         return
#     fi
# 	printf "Retornou\n\n"
# }
# # funcao1
# sim_nao;if [ "$sim_ou_nao" == "nao" ];then
# 	exit
# fi
# echo "não saiu"



# if ! [ -e "text.txt" ];then
# 	echo "no file"
# fi

# testCase=abcd
# test1=one 
# test2=two
# if [ $testCase = "123" ];then
# 	echo "123"
# elif [ $testCase = "abc" ];then
# 	echo "abc"
# elif [ $test1="one" ] && [ $test2="two" ];then
# 	echo "one and two"
# else
# 	echo "nothing"
# fi

# testCase=abc
# case $file in

# 	123)
# 		echo "123";;
# 	abc)
# 		echo "abc";;
# 	xyz | 987)
# 		echo "xyz or 987";;

# esac


# file=comandos-zorin-sicoob.txt-
# if [ -e $file ]
# then
# 	echo "achei"
# else
# 	echo "não achei"
# fi


# echo "File is open"
# yes_no() {
# 	while true; do
# 		read -p "$* [y/n]" yn
# 		case $yn in
# 			[Yy]*) yes_or_no="yes" && return 0 ;;
# 			[Nn]*) printf "Aborted\n\n" ; yes_or_no="no" && return 1;;
# 		esac
# 		yes_or_no="null"
# 	done
# }
# echo "end of funcion"
# #yes_no
# [ -z yes_no ] && return
# #functionToBreak(){
# #	echo "functionToBreak start"
# #	if [-z yes_no] && return
# #}
# #functionToBreak
# echo "end file"
