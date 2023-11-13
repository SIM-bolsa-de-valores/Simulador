# Back-End da Bolsa de Valores

# PostgreSQL

Execute:
```bash
docker run -d --name postgres-qfj -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres postgres
```

# Quarkus

Este projeto utiliza o Quarkus, o Framework Java Supersônico e Subatômico.

Se você deseja saber mais sobre o Quarkus, por favor, visite o seu site: https://quarkus.io/ .

## Executando a aplicação em modo de desenvolvimento

Você pode executar sua aplicação em modo de desenvolvimento, que permite a codificação ao vivo usando:
```shell script
./mvnw compile quarkus:dev
```

> **_NOTA:_** O Quarkus agora inclui uma Interface de Desenvolvimento (Dev UI), que está disponível apenas no modo de desenvolvimento em http://localhost:8080/q/dev/.

## Empacotando e executando a aplicação

A aplicação pode ser empacotada usando:
```shell script
./mvnw package
```
Isso produz o arquivo `quarkus-run.jar` no diretório `target/quarkus-app/`.
Este não é um _über-jar_ pois as dependências são copiadas para o diretório `target/quarkus-app/lib/`.

Se você deseja construir um _über-jar_, execute o seguinte comando:
```shell script
./mvnw package -Dquarkus.package.type=uber-jar
```

A aplicação agora pode ser executada usando `java -jar target/quarkus-app/quarkus-run.jar`.

## Criando um executável nativo

Você pode criar um executável nativo usando:
```shell script
./mvnw package -Pnative
```

Ou, se você não tiver o GraalVM instalado, pode executar a construção do executável nativo em um contêiner usando:
```shell script
./mvnw package -Pnative -Dquarkus.native.container-build=true
```

Você pode então executar seu executável nativo com: `./target/exchange-back-end-1.0.0-SNAPSHOT-runner`

Se desejar aprender mais sobre a construção de executáveis nativos, consulte https://quarkus.io/guides/maven-tooling.html.

## Guias Relacionados

- RESTEasy JAX-RS ([guia](https://quarkus.io/guides/rest-json)): Framework de ponto de extremidade REST implementando JAX-RS e mais

## Exemplos Fornecidos

### Exemplo RESTEasy JAX-RS

REST é fácil com este recurso Hello World RESTEasy.

[Seção do guia relacionada...](https://quarkus.io/guides/getting-started#the-jax-rs-resources)
