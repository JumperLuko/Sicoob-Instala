Código escrito por JumperLuko
jumperluko.github.io

Gerenciamento do desenvolvimento de funções e aperfeiçoamento do programa

- Correções
    - [x]  .desktop do Gercoop que roda em local especifo com Path=
    - [x]  corrigir condicional se não houver arquivo de instalação no sistema nem local
    - [x]  Compatilizar gercoop
    - [x]  Avaliar melhor implementação de icones no sistema
    - [x]  Colocar todos instaladores pra rodar na pasta "instaladores"
        - [x]  Redirecionar os programas de wine
        - [x]  Colocar os avisos de wine para esta pasta
        - [x]  Colocar o Caixa
    - [x]  Criar pra .desktop para Sicoob Empresarial
        - [x]  Qual será o lugar correto para instalar? na /home do usuário!
        - [x]  Como o tecnico instalará no lugar correto? O script já coloca diretamente para /opt/sicoob/Sicoob-Instala
        - [x]  Como eu encontrarei o lugar correto?
    - [ ]  Verificar quais servidores tem que realizar liberação no firewall
        - [x]  Criar anotações pra equipe
        - [ ]  verificar boa parte pelo winetricks
    - [x]  Na primeira instalação do AD colocar arquivo padrão de configuração, pois ele normalmente não gera arquivo se reiniciar o PC após ativar. Só tinha que colocar depois de logar no AD
- Categorias
    
    ## Sistema Operacional
    
    - [x]  Colocar opção dedicada para alterar nome da maquina
    - [x]  Opção de colocar swap file, e pergunta quantos GB de swal
        - [x]  Outra que permite apagar swapfile
    - [ ]  Fazer zorin configurar automaticamente o botão do menu iniciar somente na primeira inicialização
    - [ ]  Como desativar avisos de atualização e loja de software ao boot (pesquisar)
    - [x]  Configurações automáticas de compartilhamento de pasta na rede via Samba. Funciona via autofs e no iniciar sistema!
    - [ ]  script que edita rapidamente programas padrões na home do usuario mimeapps.list
    - [ ]  Sistema pede permissão para muita coisa para usuario n root (como add wifi, impressora...), liberar acessos para o usuário por padrão
    - [ ]  add sudo dpkg --add-architecture i386
    
    ## Sicoob Instala
    
    - [x]  Fazer script de instalação ao logar em novo usuário
    - [x]  script com funções: Abre e informa para usuário aguardar enquanto instalação prosegue > clique tal lugar > instalação finalizou
    - [x]  Baixar copia do sicoob instala para /opt/sicoob
        - [x]  Verificar se existe arquivo e fazer condições
        - [x]  git pull
    - [ ]  programa no sistema que se chama verificador de programas sicoob, onde indica o que está configurado e o que não está
    - [ ]  fazer um script para que o usuário possa verificar os programas instalados
    - [ ]  add opção no instalador e comando no sistema para poder entrar em outro usuário, e listar os usuários existentes antes (`cat /etc/passwd | grep /bin/bash | cut -d: -f1`**, linux list users**)
    - [ ]  Arquivo de log que registra os programas instalados e removidos (no final da instalação ou remoção ele verifica por um arquivo do programa para verificar se o processo deu certo e registra no log)
    
    ## Outros
    
    - [x]  Instalar Chrome através de repositório
    - [x]  Verificar suporte do Kaspersky para Linux. Funciona!
    - [x]  Verificar suporte do Azure Information protection para confidencialidade. Não possui para o sistema, só para uso no email web!
    - [x]  Tem como automatizar a instalação do Teams? Sim, added repo!
    - [x]  Onedrive CLI (sudo apt install onedrive) ou GUI [Isync](https://www.insynchq.com/pricing?utm_source=insync_app&utm_campaign=buy_upgrade), Onedrive funciona a partir de script
    - [ ]  verificar existencia sistema de #interno #confidencial #publico
    - [ ]  Funcionar Citrix
    - [ ]  Colocar tema branco do wine 7 por padrão
    - [ ]  Criar uma função atalho de ajuda para usuario (icone de interrogação), como. opções: se os icones da area de trabalho sumiram digite x, se sisbr não abre click x...
    - [ ]  add parar onedrive nas opções do Onedrive
    
    ## AD
    
    - [ ]  Pq não funciona autenticação tipo ad, somente a simples, será q o servidor está recusando maquinas linux?
    - [ ]  Como trocar a senha ao logar no pc linux?
    
    ## VNC
    
    - [x]  configurar o VNC ao iniciar sessão do usuário, e terá que continuar rodando após a primeira sessão
    - [x]  Onde armazenar arquivo de senha VNC? /opt/sicoob/passwordvnc.pwd !
    - [ ]  VNC que rode ao trocar de usuário
    [https://wiki.archlinux.org/title/X11vnc](https://wiki.archlinux.org/title/X11vnc)
    
    ## Programas Wine
    
    - [x]  ao administrador iniciar o programa de instalação geral, o programa vai verificar se existe o verificador de programas sicoob, se não existir vai perguntar se pode instalar, senão não informará nada
    - [ ]  Criar método de clonagem de pastas wine para automatizar o processo para o usuário
        - [ ]  Criar arquivos compactados após a instalação no sistema, como imagens do wine
        - [ ]  Ter um servidor com as imagens de pastas wine para clonagem rapoda
    - [ ]  Se variavel for diferente de vazio ele mostra o fim da execução e sempra da unset no final
    
    ### SisBR
    
    - [x]  add Desktop file, executar dentro da instalação do sisbr
    - [x]  criar pasta desktop, criar arquivo Sisbr.desktop, criar dentro icons, jogar icones dentro
    - [x]  Verificar instalação AdobeAIR ao iniciar usuário, e caso não tenha: informar o usuário e abrir janela de instalação
    - [x]  Instalador do SisBR
    - [x]  Verificar no desktop se existe instalação local do .wine o AdobeAIR, se não existir irá pedir para instalar, se existir somente executará
    - [x]  Arrumar icones do Desktop do SisBR
    - [x]  criar .desktop na area de trabalho do usuario para instalar adobeAIR, para rodar sisbr. Solução substituida para ao abrir sisbr ele solicita instalação
    - [ ]  Rodar Sisbr após instalar adobe flash (dificuldade é que o gnome terminal roda em fundo e não como um processo em sequencia no script)
    - [ ]  Enviar (principalmente) ou salvar documento pelo explorador de arquivo é muito ruim, seria bom se tivesse como melhorar essa situação através do wine
    
    ### Gercoop
    
    - [x]  Instalador do Gercoob
    - [x]  Arrumar icones do Desktop do Gercoop
    - [x]  .Desktop q roda SH do Gercoop, SH verifica irá determinar o local de execução dos arquivos e gerar uma pasta se não existir
        - [x]  o .desktop já determina o local e o SH gera arquivo?
    
    ### Sicoob empresarial
    
    - [x]  Experimentar versão java
    - [ ]  Verificar porque as vezes ele não abre mais, e fornece uma opção para o usuário reinstalar facilmente.
    
    ### Agger
    
    - [x]  Agger é importante que funcione, dependencia do dotnet452 é um problema. Resolvido, teve que rodar sob wine 32 bits
    - [ ]  Tentar tornar o processo de instalação do agger mais rápido. Talvez clonando uma pasta do programa instalado?
    
    ## Dispositivos
    
    - [x]  Testar impressora Diebold no Caixa
        - [x]  Funciona? Sim!
        - [ ]  Autenticação não está funcionando
    - [ ]  Autenticadora de cheque Panini funcionar minimamente?
        - [ ]  Drivers que temos é para windows, mas tem pra linux?
        - [ ]  A empresa fornece drivers, mas tem que contatar de maneira empresarial e eles falam ingles e parece que são do EUA
    
    ## Links
    
    Cores no terminal: [https://www.shellhacks.com/bash-colors/](https://www.shellhacks.com/bash-colors/)
    
    Automatic upgrade: [https://www.blackmoreops.com/2021/10/28/how-to-configure-automatic-updates-in-ubuntu-server/](https://www.blackmoreops.com/2021/10/28/how-to-configure-automatic-updates-in-ubuntu-server/)