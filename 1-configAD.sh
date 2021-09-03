#!/bin/bash

# Encontrar AD sicoobsmo
echo -e "\nProcurando por AD sicoobsmo.local"
realm discover sicoobsmo.local

# Exibir nome da maquina para o administrador para verificar se é isso mesmo
echo -e "\nEste é o nome da sua maquina, verifique se está correto"
hostname -f

# Criar ao add usuário
echo -e "\nConfigurando para criar pasta de usuário logar" 
sudo pam-auth-update --enable mkhomedir

# Entrar AD
echo -e "\nAD sicoobsmo.local irá ser adicionado, por favor digite a senha de administrador do AD"
sudo realm join sicoobsmo.local --user=administrador

# Verificar se está conectada ao AD
echo -e "\nVerifique se está conectado ao AD"
realm list sicoobsmo.local

# Sair do AD (é uma anotação)
#sudo realm leave sicoobsmo.local
