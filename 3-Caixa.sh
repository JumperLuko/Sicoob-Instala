#!/bin/bash

# Manual
#! https://java.com/en/download/help/linux_install.html

# Download Java i586
wget https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245048_d3c52aa6bfa54d3ca74e617f18309292 -O /tmp/jre-8u301-linux-i586.tar.gz

# Extrair em /opt java i586
# sudo mkdir /opt/jre-i586
#? chmod +777 /opt/jre-8-i586
sudo tar zxvf /tmp/jre-8u301-linux-i586.tar.gz -C /opt/
# ls /opt/jre1 | mv /opt/$VARIABLE /opt/jre1.8.0_i586
#? chmod +777 -r /opt/jre-8-i586

# Criar pasta de instalação e dar permissão (se não criar, o instalador não consegue instalar sem sudo)
sudo mkdir /opt/SicoobTerminal
sudo chmod +777 /opt/SicoobTerminal

# instalar java
#? usar Sudo ? testar!
/opt/jre-8-i586/jre1.8.0_301/bin/java -jar .../Plataforma de Caixa3/Setup.jar

