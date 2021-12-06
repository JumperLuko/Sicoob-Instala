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
echo -e "\e[1;5;34mInstale em \e[0m/home/PastaDoUsuario/Sicoobnet"
sleep 3
javaws $relativeDir/instaladores/InstaladorLegadoSicoobnetEmpresarial.jnlp >> $HOME/Downloads/SicoobInstalado.log

echo "Gerando atalhos"
cp $relativeDir/scripts/sicoobnet.sh $HOME/Sicoobnet/
chmod +x $HOME/Sicoobnet/sicoobnet.sh
cp $relativeDir/desktop/sicoob-empresarial.desktop $HOME/.local/share/applications/
sed -i -e "s/someUser/$USER/" $HOME/.local/share/applications/sicoob-empresarial.desktop