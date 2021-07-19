# Local onde ficará os programas e instaladores
echo "Criando pasta do wine e instaladores"
sudo mkdir /opt/wine/
sudo mkdir /opt/wine/instaladores/

# Criar diretório do wine
echo "Criando diretório do wine em /opt/wine/"
sudo WINEPREFIX=/opt/wine/ wine wineboot

# copiar instalador para /opt/wine/instaladores/
#! Futuramente tem que copiar somente se não existir o arquivo em instaladores
echo "copiando instalador do Sisbr e AdobeAir para pasta de instaladores"
sudo cp AdobeAIRInstaller.exe /opt/wine/instaladores/
sudo cp Sisbr20.exe /opt/wine/instaladores/

# Instalar AdobeAir na pasta do sistema (precaução)
echo "Instalando AdobeAIR"
sudo WINEPREFIX=/opt/wine/ wine /opt/wine/instaladores/AdobeAIRInstaller.exe

# Instalar SisBR
echo "Instalando SisBR"
sudo WINEPREFIX=/opt/wine/ wine /opt/wine/instaladores/Sisbr20.exe 

# Permissão para todos editarem
echo "fornecendo permissões para todos usarem a pasta od SisBR"
sudo chmod 777 -R /opt/wine/drive_c/Sisbr\ 2.0/

# SisBR irá atualizar e rodar automáticamente