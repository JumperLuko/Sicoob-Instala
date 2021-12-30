#!/bin/bash

echo -e "\nVerifique como está o uso da memória atualmente"
free -h
echo -e "\nVerifique onde está o swap atual"
swapon --show
echo -e "\nVerifique quanto espaço em disco você possui"
df -h -l /
# sudo fdisk -l

echo -e "\nQuantos GB de swap você definirá?"
echo "C para cancelar"
read swapsize

swapName=swapfile-"$swapsize"G

while true; do
    case $swapsize in
        [0-9]) 
            if ! [ -e /$swapName ]; then
                sudo fallocate -l "$swapsize"G /$swapName
                # sudo dd if=/dev/zero of=/$swapName bs=$((swapsize*1024)) count=$((swapsize*1024*1024))

                # allow to others users read information about swapfile
                sudo chmod 600 /mnt/$swapName
                sudo mkswap /$swapName
                sudo swapon /$swapName
                echo "$swapName swap swap defaults 0 0" | sudo tee -a /etc/fstab
            else
                echo "Já existe um arquivo de swap com o mesmo nome"
            fi
            break;;
        "sair"|"exit"|"C")
            echo "Cancelado!"
            break;;
        *) 
            read -p "Por favor digite um número válido: " opcao;;
    esac
done

# Remover swap file
# sudo nano /etc/fstab
# sudo swapoff /$swapName
# sudo rm /$swapName

# https://net2.com/how-to-increase-swap-space-in-linux/