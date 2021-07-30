#!/bin/bash

homeGercoop="$home/.local/share/gercoop/"
runGercoop(){ (cd "$home/.local/share/gercoop/"; wine "/opt/sicoob/wine/drive_c/GerCoop/GerCoop.exe") }

# Executa na pasta do Gercoop, se não houve, criará
if [ -d "$homeGercoop" ]; then
	runGercoop
elif ! [ -e "$homeGercoop" ]; then
	mkdir "$homeGercoop"; runGercoop
elif [ ! -d "$homeGercoop" ] && [ -e "$homeGercoop" ]; then
	(cd "$home/.local/share/" && mv "gercoop" "gercoop-file")
	mkdir "$homeGercoop"; runGercoop
fi
