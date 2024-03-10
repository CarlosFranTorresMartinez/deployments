<h1 align="center"> DEPLOYMENTS </h1>

Ejemplos basicos de despliegues de base de datos, mensageria, etc

## Installation
Ejecuta este comando para iniciar con el despliegue, el comando -d es para inicar que se ejecutara el docker compose en segundo plano.
```bash
docker-compose up -d
```

## Base de datos
### PostgreSQL
Para la carpeta PostgreSQL contiene 2 archivos y Dockerfile y init.sql

En este caso si se desea levantar una base de datos se puede modificar el init.sql, agregando tu base de datos

- connection: localhost:5432
- user: develop
- pass: develop123

### MongoBD
Para la carpeta MongoDB contiene 2 archivos y Dockerfile y mongo-init.js

En este caso si se desea levantar una base de datos se puede modificar el mongo-init.sql, los usuarios o mantenerlos, tener en cuenta que no es necesario crear colecciones en MongoDB ya que lo hace por default, y si en este caso se desea agregar se modificaria el archivo mongo-init.js

- connection: localhost:27017
- user: develop
- pass: develop123

## Mensajeria
### Kafka
Una vez se levanta los servicios, vas a requerir crear un topico, para [mas informacion](https://kafka.apache.org/documentation/).

Hay que escribir el siguiente comando para poder ingresar a kafka
```bash
docker exec -it nombre_del_contenedor bash
```

Una vez ingresa a la consola bash de kafka
```bash
kafka-topics --bootstrap-server localhost:9092 --create --topic nombre_de_topico 
```

Crear group id para consumir
#### Para consumir un mensaje
```bash
kafka-console-consumer --bootstrap-server localhost:9092 --topic nombre_de_topico --group nombre_grupo_id
```

Ejecutaremos el siguiente comando para ver una lista y ver si se creo correctamente el topico
```bash
kafka-topics --bootstrap-server localhost:9092 --list
```

Ahora para producir un mensaje y consumir un mensaje hay que abrir 2 consolas y ingresamos a bash

#### Para producir un mensaje
```bash
kafka-console-producer --bootstrap-server localhost:9092 --topic asistencias
```

#### Para consumir un mensaje
```bash
kafka-console-consumer --bootstrap-server localhost:9092 --topic asistencias
```

