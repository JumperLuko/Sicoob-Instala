Código escrito por JumperLuko
jumperluko.github.io

- Ideias
    - [x]  .Desktop q roda SH do Gercoop, SH verifica irá determinar o local de execução dos arquivos e gerar uma pasta se não existir
        - [x]  o .desktop já determina o local e o SH gera arquivo?
    - [x]  Instalar Chrome através de repositório
    - [ ]  Fazer zorin configurar automaticamente o botão do menu iniciar somente na primeira inicialização
    - [ ]  pesquisar como desativar avisos de atualização e loja de software ao boot
    - [x]  ao administrador iniciar o programa de instalação geral, o programa vai verificar se existe o verificador de programas sicoob, se não existir vai perguntar se pode instalar, senão não informará nada
    - [ ]  programa no sistema que se chama verificador de programas sicoob
    - [x]  script com funções: Abre e informa para usuário aguardar enquanto instalação prosegue > clique tal lugar > instalação finalizou
    - [ ]  criar .desktop na area de trabalho do usuario para instalar adobeAIR, para rodar sisbr
    - [ ]  fazer um script para que o usuário possa verificar os programas instalados
    - [x]  criar pasta desktop, criar arquivo Sisbr.desktop, criar dentro icons, jogar icones dentro
    - [x]  testar leitora panini no Linux. Funciona!
    - [x]  Fazer script de instalação ao logar em novo usuário
    - [x]  add Desktop file, executar dentro da instalação do sisbr
    - [ ]  verificar existencia sistema de #interno #confidencial #publico
    - [x]  Testar impressora Diebold no Caixa
        - [x]  Funciona? Sim!
    - [ ]  Testar leitor de cheque no Linux
    - [ ]  Autenticadora de cheque Panini funcionar minimamente?
        - [ ]  Drivers que temos é para windows, mas tem pra linux?
        - [ ]  A empresa fornece drivers, mas tem que contatar de maneira empresarial e eles falam ingles e parece que são do EUA
    - [x]  Colocar opção dedicada para alterar nome da maquina
    - [x]  Baixar copia do sicoob instala para /opt/sicoob
        - [x]  Verificar se existe arquivo e fazer condições
        - [x]  git pull
    
- Correções
    - [x]  .desktop do Gercoop que roda em local especifo com Path=
    - [x]  corrigir condicional se não houver arquivo de instalação no sistema nem local
    - [x]  Compatilizar gercoop
    - [x]  Avaliar melhor implementação de icones no sistema
    - [x]  Colocar todos instaladores pra rodar na pasta "instaladores"
        - [x]  Redirecionar os programas de wine
        - [x]  Colocar os avisos de wine para esta pasta
        - [x]  Colocar o Caixa
    - [ ]  Criar pra .desktop para Sicoob Empresarial
        - [x]  Qual será o lugar correto para instalar? na /home do usuário!
        - [ ]  Como o tecnico instalará no lugar correto?
        - [ ]  Como eu encontrarei o lugar correto?
    - [ ]  Verificar quais servidores tem que realizar liberação
        - [ ]  Criar anotações pra equipe
        - [ ]  verificar boa parte pelo winetricks
        - [ ]  
- Categorias
    
    ## Gerais
    
    - [ ]  Primeira abertura do usuário exibir zorin-appearance
    - [ ]  Opção de colocar swap file, e pergunta quantos GB de swal
        - [ ]  Outra que permite apagar swapfile
    
    ## Outros
    
    - [ ]  Tentar Citrix
    - [ ]  Configurações automáticas de compartilhamento de pasta na rede via Samba
    - [ ]  Agger é importante que funcione, dependencia do dotnet452 é um problema
    - [ ]  Verificar suporte do Kaspersky para Linux
    - [ ]  Verificar suporte do Azure Information protection para confidencialidade
    - [ ]  Onedrive CLI (sudo apt install onedrive) ou GUI [Isync](https://www.insynchq.com/pricing?utm_source=insync_app&utm_campaign=buy_upgrade)
    
    ## Teams
    
    - [x]  Tem como automatizar a instalação? Sim, added repo!
    
    ## VNC
    
    - [x]  configurar o VNC ao iniciar sessão do usuário, e terá que continuar rodando após a primeira sessão
    - [x]  Onde armazenar arquivo de senha VNC? /opt/sicoob/passwordvnc.pwd !
    - [ ]  VNC que rode ao trocar de usuário
    [https://wiki.archlinux.org/title/X11vnc](https://wiki.archlinux.org/title/X11vnc)
    
    ## SisBR
    
    - [x]  Verificar instalação AdobeAIR ao iniciar usuário, e caso não tenha: informar o usuário e abrir janela de instalação
    - [x]  Instalador do SisBR
    - [x]  Verificar no desktop se existe instalação local do .wine o AdobeAIR, se não existir irá pedir para instalar, se existir somente executará
    - [x]  Arrumar icones do Desktop do SisBR
    
    ## Gercoop
    
    - [x]  Instalador do Gercoob
    - [x]  Arrumar icones do Desktop do Gercoop
    
    ## Sicoob empresarial
    
    - [x]  Experimentar versão java
    
    ## Cores no terminal
    
    [https://www.shellhacks.com/bash-colors/](https://www.shellhacks.com/bash-colors/)
    
    ## Automatic upgrade
    
    [https://www.blackmoreops.com/2021/10/28/how-to-configure-automatic-updates-in-ubuntu-server/](https://www.blackmoreops.com/2021/10/28/how-to-configure-automatic-updates-in-ubuntu-server/)