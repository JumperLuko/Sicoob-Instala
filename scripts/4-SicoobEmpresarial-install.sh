#!/bin/bash

# Verificar caminhos das dependencias
if [ "$scriptsDir" == "" ] && [ -e "./scripts/" ];then
    scriptsDir=./scripts
    relativeDir=.
elif [ "$scriptsDir" == "" ];then
    scriptsDir=.
    relativeDir=..
fi

echo "Instalando Sicoob Empresarial"
javaws $relativeDir/instaladores/InstaladorLegadoSicoobnetEmpresarial.jnlp

#! Criar .desktop para usuário
# dificuldade 1: O usuário terá que saber onde instalar
# dificuldade 2: Eu terei que referenciar o .desktop onde o usuário instalar