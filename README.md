# Sicoob Instala ![alt text](./sicoob-instala.svg "Sicoob Instala") 
Programa para instalação, configuração e compatibilidade automátizada de sistemas Linux baseados no Ubuntu para Sicoob

- Configura, instala pacotes e atualiza o sistema
- Compatibiliza programas Windows (wine)
- Implementa scripts de verificação e execução ao iniciar usuário

## Como utilizar
1. Baixe o arquivo comprimido
2. Descobrima o arquivo
3. Clique 2 vezes no INSTALADOR.sh
4. Rode no terminal

Simples assim, tudo será exibido no terminal. 


## Identificação dos pacotes
### Niveis
0. Instalações basicas e primárias para o funcionamento do sistema (costumam ter alta criticidade de quebrar o sistema)

1. Configurações do sistema (costumam ter baixa criticidade de quebrar o sistema)

2. Instalações de programas comuns (as vezes podem apresentar algum problema)

3. Instalação de pacote Wine (raramente afetam o sistema, mas afetam os programs que rodam com wine)

4. Instalação de pacotes Isolados, tais como, Flatpak, Snap, Appimage, Java ou SH sem permissão elevada (costumam não alterar o sistema)

# User case atual
- Computadores de atendimento, este possui todas as aplicações necessárias operantes

# Desafios atuais
- Driver da digitalizadora de cheque para Linux (Caixa)
- Autenticadora da impressora ser reconhecida (Caixa)
- Pinpad criptografado ser reconhecido (Caixa)
