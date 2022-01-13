#!/bin/bash

# Verificar caminhos das dependencias
if [ "$scriptsDir" == "" ] && [ $(pwd) == "/opt/sicoob/Sicoob-Instala" ] || [ "$scriptsDir" == "" ] && [ -e "./scripts/" ] || [ -e "./INSTALADOR.SH" ];then
    scriptsDir=$(pwd)/scripts
    relativeDir=$(pwd)
elif [ "$scriptsDir" == "" ];then
    scriptsDir=$(pwd)
    relativeDir=$(pwd)/..
fi

echo "Instalando Sicoob Empresarial"
echo -e "\e[1;5;34mInstale em \e[0m/home/PastaDoUsuario/Sicoobnet"
sleep 3
# Roda no caminho do sicoob instala correto 
(cd $HOME && javaws $relativeDir/instaladores/InstaladorLegadoSicoobnetEmpresarial.jnlp) >> $HOME/Downloads/SicoobInstala.log

echo "Gerando atalhos e icones"
cp $relativeDir/desktop/run/sicoobnet.sh $HOME/Sicoobnet/
chmod +x $HOME/Sicoobnet/sicoobnet.sh
cp $relativeDir/desktop/sicoob-empresarial.desktop $HOME/.local/share/applications/
sed -i -e "s/someUser/$HOME/" $HOME/.local/share/applications/sicoob-empresarial.desktop
# Icones no home do usuário, junto com verificação da existencia das pastas
if ! [ -e "$HOME/.local/share/icons/hicolor/" ]; then
    mkdir $HOME/.local/share/icons && mkdir $HOME/.local/share/icons/hicolor/
fi
if ! [ -e "$HOME/.local/share/icons/hicolor/128x128/apps/" ]; then
    mkdir $HOME/.local/share/icons/hicolor/128x128 && mkdir $HOME/.local/share/icons/hicolor/128x128/apps/
fi
if ! [ -e "$HOME/.local/share/icons/hicolor/32x32/apps/" ]; then
    mkdir $HOME/.local/share/icons/hicolor/32x32/ && mkdir $HOME/.local/share/icons/hicolor/32x32/apps/
fi
if ! [ -e "$HOME/.local/share/icons/hicolor/16x16/apps/" ]; then
    mkdir $HOME/.local/share/icons/hicolor/16x16/ && mkdir $HOME/.local/share/icons/hicolor/16x16/apps/
fi

cp $relativeDir/desktop/hicolor/128x128/apps/SicoobEmp.png $HOME/.local/share/icons/hicolor/128x128/apps/
cp $relativeDir/desktop/hicolor/128x128/apps/SicoobEmp.png $HOME/.local/share/icons/hicolor/32x32/apps/
cp $relativeDir/desktop/hicolor/64x64/apps/SicoobEmp.png $HOME/.local/share/icons/hicolor/16x16/apps/