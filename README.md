# Sample Projeto 

Passo a passo para referenciar a lib desafio-ios-lib

- Primeiro efetuar o clone da lib no repo https://github.com/roqueiroz/desafio-ios-lib.git.

- Apos o build, copiar o full path do projeto. 

- No arquivo Podfile, colar o full path do projeto desafio-ios-lib na linha 10 conforme a imagem abaixo

<img width="793" alt="Captura de Tela 2022-10-23 às 14 47 30" src="https://user-images.githubusercontent.com/5687225/197407656-30968b4b-fbcf-4200-82f1-c3b168daeb29.png">

- Executar o pod install


Utilizaçao: 

- Importar a lib na classe de utilização e chamar a classe publica da lib - Exemplo: Ticket.shared;

- Unica função disponível é a requestTicket();

