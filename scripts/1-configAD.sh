#!/bin/bash

# Encontrar AD sicoobsmo
echo -e "\nProcurando por AD sicoobsmo.local"
realm discover sicoobsmo.local

# Exibir nome da maquina para o administrador para verificar se é isso mesmo
echo -e "\nEste é o nome da sua maquina, verifique se está correto"
hostname -f

# Entrar AD
echo -e "\nAD sicoobsmo.local irá ser adicionado, por favor digite a senha de administrador do AD"
sudo realm join sicoobsmo.local --user=administrador

# Criar ao add usuário e mudar para autenticação simples
echo -e "\nConfigurando parametros para bom funcionamento" 
sudo pam-auth-update --enable mkhomedir
sudo sed -i -e 's/access_provider = ad/access_provider = simple/' /etc/sssd/sssd.conf

# Verificar se está conectada ao AD
echo -e "\nVerifique se está conectado ao AD"
realm list sicoobsmo.local

# Sair do AD (é uma anotação)
#sudo realm leave sicoobsmo.local
