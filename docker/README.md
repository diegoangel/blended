# Como utilizar Docker con el proyecto

## Prerrequisitos

Tener docker y docker compose instalados

NOTA: todos los comandos se ejecutan parados en el root / del proyecto	

## Configuracion

La implementacion tiene la siguiente estructura:

- **docker/** directorio donde estan los archivos de configuracion de los servicios Nginx, PHP, Postgres y Redis
- **Dockerfile** archivo con las instrucciones de instalacion del container con PHP y tools/extensiones relacionadas
- **docker-compose.yml**  es el archivo que permite la coordinacion, comunicacion y configuracion de una aplicacion multi-container

## Creacion e inicializacion

Este comando crea las imagenes, crea e inicia los containers

    docker-compose up

NOTA: Va a tardar y consumir recursos de la compu porque tiene que descargar e instalar varias cosas.

Ver Dockerfile y docker-compose.yml, si se quiere, para interiorizarse sobre que cosas se instalan.

## Detener los containers

Detener los containers iniciados

	docker-compose stop

## Iniciar los containers

Volver a iniciar containers ya existentes

	docker-compose start
	
## Remover containers creados

Elimina los containers creados. Es el comando opuesto a `docker-compose up`

	docker-compose down

## Listar containers ejecutandose

	docker-compose ps

Deberian visualizar los siguientes containers para el proyecto:

- blended-app
- blended-nginx
- blended-mysql
- blended-redis

## Acceder y ejecutar comandos dentro de containers

	docker exec -it <nombre-del-container> <comando> 
	
Ejemplo para ejecutar `composer update` dentro del container:

	docker exec -it blended-app composer update

## Eliminar todas las imagenes, containers y volumenes del proyecto !

	docker system prune -a -f --volumes --filter "name=blended"
	
## Tools utiles para gestionar containers

- [Dockly](https://www.npmjs.com/package/dockly) aplicacion de consola, requiere Node
- [Easy Docker ](https://extensions.gnome.org/extension/2224/easy-docker-containers) extension para entornos Linux con Gnome
