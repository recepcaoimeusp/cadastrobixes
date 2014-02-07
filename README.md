kit_bIXO
========


Guia superficial para instalação:

- Instale ruby (versão 2 ou mais provavelmente) e rails versão 3 ou mais.

- Na pasta do projeto, rode os comandos: (Para instalar dependências)
$ gem install bundler
$ bundle install

- Para configurar o BD inicial:
$ rake db:create && rake db:migrate

- Para iniciar o servidor, rode:
$ rails server

===========================================================

DONE:

- Eu (Victor) fiz uma onde tem uma tabela com as informações de
todos os bixos, mas puxando tudo da tabela Vendas e filtrando
um pouco as informações....ta meio POGado. Ainda vou melhorar.
Foi mais pra efeito de eu aprender um pouco de rails.



TODO list:

- Criar um modo (provavelmente via login) de saber qual veterano recebeu 
cada pagamento do kit.


O Victor mandou um e-mail para o Arthur e para a Taís para confirmar 
que são essas as mudanças que eles pediram.
