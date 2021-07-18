#!/bin/bash

# Encontrar AD sicoobsmo
echo "Procurando por AD sicoobsmo.local"
realm discover sicoobsmo.local

# Exibir nome da maquina para o administrador para verificar se é isso mesmo
echo "Este é o nome da sua maquina, verifique se está correto"
hostname -f

# Entrar AD
echo "AD sicoobsmo.local irá ser adicionado, por favor digite a senha de administrador do AD"
sudo realm join sicoobsmo.local --user=administrador

# Verificar se está conectada ao AD
echo "Verifique se está conectado ao AD"
realm list sicoobsmo.local

# Sair do AD (é uma anotação)
#sudo realm leave <%AD Domain Name%>
