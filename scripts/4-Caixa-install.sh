#!/bin/bash

# Verificar caminhos das dependencias
if [ "$scriptsDir" == "" ] && [ -e "./scripts/" ];then
    scriptsDir=./scripts
    relativeDir=.
elif [ "$scriptsDir" == "" ];then
    scriptsDir=.
    relativeDir=..
fi

# Manual
#! https://java.com/en/download/help/linux_install.html

javaPWD=/opt/jre1.8.0_i586

if ! [ -e "/opt/jre1.8.0_i586" ]; then
    # Download Java i586
    wget https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245048_d3c52aa6bfa54d3ca74e617f18309292 -O /tmp/jre-8u301-linux-i586.tar.gz

    # Extrair em /opt java i586
    # sudo mkdir /opt/jre-i586
    #? chmod +777 /opt/jre-8-i586
    sudo tar zxvf /tmp/jre-8u301-linux-i586.tar.gz -C /opt/

    javaFolderDownload=$(ls /opt/ | grep jre1.8)
    sudo mv /opt/$javaFolderDownload $javaPWD
    unset javaFolderDownload
    #? chmod +777 -r /opt/jre-8-i586
elif  [ -e "/opt/jre1.8.0_i586" ]; then
    echo "Java i586 encontrado, pulando instalação Java"
else
    echo "Erro inesperado ao verificar instalação do Java i586"
fi

# Criar pasta de instalação e dar permissão (se não criar, o instalador não consegue instalar sem sudo)
# sudo mkdir /opt/SicoobTerminal
# sudo chmod +777 /opt/SicoobTerminal

# instalar java
(cd $relativeDir/instaladores/Plataforma_Caixa && sudo $javaPWD/bin/java -jar ./Setup.jar)

# Rodar Terminal com root
#sudo '/opt/jre1.8.0_i586/bin/java' -jar terminal.jar
