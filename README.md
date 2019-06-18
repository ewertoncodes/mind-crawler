# Mind Crawler

Uma simples api escrita em Rails para extrair citações do site Quotes to Scrape.

## Como funciona

 O usuário deve se autenticar para usar o sistema. 
 Após colocar a tag das citações que procura, o script irá buscar no site [quotes to scrape](http://quotes.toscrape.com/) os dados. Se a tag existir a aplicação realiza a extração dos dados por todas as páginas com aquela tag. Caso a tag não existe a aplicação irá retornar uma  mensagem avisando que a tag não existe.

---
## Instalação

#### **Pré-requisitos**

- Ruby 2.5 - Recomendo instalar com o [RVM](https://rvm.io/)
- MongoDB - [Instalação do MongoDB](https://docs.mongodb.com/manual/administration/install-community/)

Clone o projeto:

```bash 
git clone https://github.com/ewertondev/mind-crawler.git 
```
Acesse o diretorio:

```bash 
cd mind-crawler/
```

Instale as dependências:

```bash
bundle install
```

Copie o .env.sample para um arquivo .env:

```bash
cp .env.sample .env
```

Inicie o serviço do **MongoDB** rodando:

```bash
sudo systemctl start mongodb
```
Rode os testes:

```bash
rspec spec
```

 Levante sua aplicação com o comando:

```bash
rails server
```
---


## Como usar

### Opção 1 - via linha de comando

Instale o [httpie](https://github.com/jakubroztocil/httpie#installation)

```bash
apt-get install httpie
```


### Realizando uma requisição sem se autenticar:

```bash
http get http://localhost:3000/quotes/life`
```

Resposta:

`401 Unauthorized`



### Criando um usuário:

```bash
echo '{ "user": { "email":"foo@foo.com", "name":"foo", "password":"123456"  } }' | http post http://localhost:3000/signup`
```

Resposta: 

`200 OK`





### **Logando com um usuário:**

```bash
echo '{ "auth": { "email":"foo@foo.com", "password":"123456"  } }' | http post http://localhost:3000/user_token
```

Resposta:  

`201 Created`

```bash
{
"jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjA5Mzg1ODksInN1YiI6eyIkb2lkIjoiNWQwOGI1ZmQ2YjBmODgzNDJjYzNhM2FkIn19.4q5k$`
`U1a-kl5H637jKmIcGkk3t6vA79T_IGO-yIACFg"
}
```

### Acessando um recurso:

```bash 
http get http://localhost:3000/quotes/life "Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjA5MTg0ODgsInN1YiI6eyIkb2lkIjoiNWQwODY4MTE2YjBmODg3YmFhYjZkOWFlIn19.ARfP3EfzIt9pEc0eyIcgkKe4GUNIoTE5I7aexPgOpJQ"
```

Resposta:

 `200 OK` 

---

### Opção 2 - via Postman


[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/a7dbd3a1bb6729add572)