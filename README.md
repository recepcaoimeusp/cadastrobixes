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

- Separado bixo e vendas em duas tabelas.
- Criado views e controllers para bixos e vendas (Precisa checar tudo ainda)



TODO list:

- Criar um modo (provavelmente via login) de saber qual veterano recebeu 
cada pagamento do kit.

- Criar uma tabela, controller e view da atlética onde associaremos a
cada bixo as modalidades que ele está interessado. Provavelmente essas
modalidades tem que vir de uma lista.

- Criar links faltantes em algumas views. Ex: Provavelmente está faltando
link para excluir bixos na index dos bixos

