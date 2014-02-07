kit_bIXO
========


Guia superficial para instalação:

- Instale ruby (versão 2 ou mais provavelmente, com o pacote de desenvolvimento) e rails versão 3 ou mais.
- Instale a libsqlite3 (com o pacote de desenvolvimento também).

- Na pasta do projeto, rode os comandos como root: (Para instalar dependências)
```bash
$ gem install bundler
$ bundle install
```

- Para configurar o BD inicial:
```bash
$ rake db:create && rake db:migrate
```

- Na pasta /config/initializers do projeto, crie um arquivo chamado "secret_token.rb",
  e dentro dele coloque:
```ruby
KitbIXO2::Application.config.secret_token = '\*\*\*'
```
  onde \*\*\* é a saída do comando:
```bash
$ rake secret
```

- Para iniciar o servidor, rode:
```bash
$ rails server
```

- Sempre que o esquema do BD mudar, rode:
```bash
$ rake db:schema:load
```

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

