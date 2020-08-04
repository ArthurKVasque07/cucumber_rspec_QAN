# cucumber_rspec_QAN
Cucumber, respec, ruby, qa ninja curso
necessary downloads:

docker network create --driver bridge skynet

docker pull postgres
docker pull dpage/pgadmin4

docker run --name pgdb --network=skynet -e "POSTGRES_PASSWORD=qaninja" -p 5432:5432 -v var/lib/postgresql/data -d postgres

docker run --name pgadmin --network=skynet -p 15432:80 -e "PGADMIN_DEFAULT_EMAIL=root@qaninja.io" -e "PGADMIN_DEFAULT_PASSWORD=qaninja" -d dpage/pgadmin4

### Criação da Base de Dados

* Logue no PGADMIN [http://192.168.99.100:15432]
  user: root@qaninja.io
  pass: qaninja
* Crie uma conexão com o servidor pgdb
* Crie uma base de dados com o nome ninjaflix

## Publicando o Backend

### Download das Imagens

```bash
docker pull qaninja/nflix-api
```

### Colocando a API no Ar
docker run --name nflix-api --network=skynet -e "DATABASE=pgdb" -p 3000:3000 -d qaninja/nflix-api

## Publicando o Frontend

### Download das Imagens

docker pull qaninja/nflix-web

Colocando a WebApp no ar 
docker run --name nflix-web --network=skynet -p 8080:8080 -e "VUE_APP_API=http://192.168.99.100:3000" -d qaninja/nflix-web

## Criando o usuário Admin

* Instale o Postman [https://www.postman.com/downloads/]
* Acesse a Documentação da API [http://192.168.99.100:3000/apidoc]
* Crie um novo usuário enviando um POST na rota /user  da API
* Acesse a WebApp [http://192.168.99.100:8080]
* Faça login

## Subindo os containers

```bash
docker start pgdb
docker start pgadmin
docker start nflix-api
docker start nflix-web
```

## Parando os containers

```bash
docker stop pgdb
docker stop pgadmin
docker stop nflix-api
docker stop nflix-web
```

## Comandos Docker
# removendo um container
docker rm nome_ou_id_do_container

# removendo na marra
docker rm nome_ou_id_do_container -f

# listando containers
docker ps

# listando container parados
docker ps -a

# listando imagens
docker images

# removendo uma imagem
docker rmi nome_ou_id_da_imagem

# removendo uma imagem com ignorância
docker rmi nome_ou_id_da_imagem -f


