#!/bin/bash

# Utiliza wine-devel mais atualizado, senão utiliza a versão mais antiga do sistema 
if [ -e "/opt/wine-devel/bin/wine" ]; then
    wine_devel=/opt/wine-devel/bin/wine
else
    wine_devel=/usr/bin/wine
fi

wine64Folder="$HOME/.wine64/"
homeGercoop="$HOME/.local/share/gercoop/"
runGercoop(){ (cd "$homeGercoop"; env WINEPREFIX="$wine64Folder" $wine_devel "/opt/sicoob/wine/drive_c/GerCoop/GerCoop.exe") }

# Executa na pasta do Gercoop, se não houve, criará
if [ -d "$homeGercoop" ]; then
	runGercoop
elif ! [ -e "$homeGercoop" ]; then
	mkdir "$homeGercoop"; runGercoop
elif [ ! -d "$homeGercoop" ] && [ -e "$homeGercoop" ]; then
	(cd "$home.local/share/" && mv "gercoop" "gercoop-file")
	mkdir "$homeGercoop"; runGercoop
fi
