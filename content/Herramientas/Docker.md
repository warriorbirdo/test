---
title: Docker
draft: "true"
tags:
  - Herramienta
  - Docker
---
#### Recursos externos
- [Repositorio de imágenes de docker](https://hub.docker.com/)
- [Documentación oficial](https://docs.docker.com/reference/cli/docker/)

# Gestión de contenedores

[Oficial](https://docs.docker.com/reference/cli/docker/container/)

```
docker container
```

Iniciar un contenedor:

```
docker run [parámetros] <contenedor>:[versión]
```

Parámetros para `docker run`:
- `-d` &rarr; Inicia un contenedor desvinculado de la terminal (en segundo plano).
- `-i` &rarr; Inicia un contenedor interactivo (abre una consola desde el contenedor)
- `--ip [IPv4]` &rarr; Establece una IPv4 para la red a la que se conecte el contenedor.
- `--mount` o `-v` &rarr; Asigna un volumen a un contenedor.
- `--name [nombre]` &rarr; Asigna un nombre al contenedor.
- `--network [red]` &rarr; Asigna una red al contenedor.
- `-p [pHost]:[pCont]` &rarr; Mapea un puerto entre el host y el contenedor.
- `--rm` &rarr; Borra automáticamente el contenedor cuando deja de ejecutarse.

Sintaxis y parámetros para `docker run --mount`:

 ```
 --mount <key>=<value>[,<key>=<value>...]
 ```
 
- `type=<val>` &rarr; Por defecto es `volume`. Es preferifle omitirlo y usar la opción por defecto ya que `bind` es algo más antíguo.
- `src=<val>` &rarr; Nombre o ruta absoluta del volumen.
- `dst=<val>` &rarr;  Rutas donde se montará el volumen dentro del contenedor.
- `ro` &rarr; Se marca el volumen como *readonly*. En caso de no ser necesario, se omite el parámetro.

Sintaxis y parámetros para `docker run -v`:

```
-v <host-path>:<container-path>[:opts]
```

- `ro` &rarr; Se marca el volumen como *readonly*. En caso de no ser necesario, se omite el parámetro.

Listar contenedores:

```
docker ps
```

- `-a` &rarr; Muestra los contenedores inactivos.

Iniciar un contenedor apagado:

```
docker start <contenedor>
```

Detener un contenedor:

```
docker stop <contenedor>
```

Detener todos los contenedores activos:

```
docker stop $(docker ps -q)
```

Ejecutar una terminal en un contenedor activo:

```
docker exec -it <contenedor> bash
```

Borrar un contenedor:

```
docker rm <contenedor>
```

Borrar todos los contenedores:

```
docker rm $(docker ps -a -q)
```

Mostrar información sobre un contenedor:

```
docker inspect <contenedor>
```

Mostrar logs de un contenedor a tiempo real:

```
docker logs --follow <contenedor>
```

Para iniciar un contenedor siempre que se encienda la máquina anfitriona:

```
docker update --restart=always <contenedor>
```

Para cancelar el estado anterior se cambiará `always` por `no`.

# Gestión de Imágenes
 [Oficial](https://docs.docker.com/reference/cli/docker/image/)

```
docker image
```

Listar imágenes:

```
docker images
```

Borrar imagen:

```
docker rmi <imagen>
```

Descargar imagen:

```
docker pull <imagen>
```

Borrar todas las imágenes que no estén siendo usadas:

```
docker image prune -a
```

# Gestión de Volúmenes
 [Oficial](https://docs.docker.com/reference/cli/docker/volume/) | [Almacenamiento](https://docs.docker.com/engine/storage/#volume-mounts)

Como los contenedores son para usar y tirar se crean los volúmenes para preservar los datos y poder compartir dichos datos con otros contenedores.

Listar volúmenes:

```
docker volume ls
```
  
Crear un volumen:

```
docker volume create [parámetros] [nombre]
```

Borrar un volumen:

```
docker volume rm
```

Mostrar información sobre un volumen:

```
docker volume inspect
```

"Mountpoint" es la ruta del equipo anfitrión donde está almacenado el volumen.

*En Windows los volúmenes se almacenan en la ruta:*

```
\\wsl$\docker-desktop\mnt\docker-desktop-disk\data\docker\volumes
```

**Kubernetes** o **K8s** es una herramienta para automatizar la gestión (incluyendo la creación y eliminación) de contenedores.

# Gestión de Redes
[Oficial](https://docs.docker.com/reference/cli/docker/network/)

```
docker network
```

Tipos configuración de red en docker:
- **Nombre:** none / **Driver:** null &rarr; Red desactivada.
- **Nombre:** bridge / **Driver:** bridge &rarr; Tiene conexión a internet. Como modo NAT en VirtualBox.
- **Nombre:** host / **Driver:** host &rarr; Solo anfitrión. Sólo es posible la conexión entre los contenedores dentro de la máquina anfitriona.

Listar redes:

```
docker network ls
```

Crear una red:  

```
docker network create --driver bridge --subnet 172.25.0.0 <network_name>
```

- `--driver <tipo de red>` &rarr; Define el tipo de red.
- `--subnet <red>` &rarr; Establece la ip de la red. Ejemplo: 172.25.0.0
- `--gateway <dirección del gateway>` &rarr; Establece la IP del gateway. Ejemplo: 172.25.0.1

Mostrar información sobre una red:

```
docker network inspect <network_name> 
```
  
Borrar una red:

```
docker network rm <network_name>
```
  
Conectar un contenedor a una red:

```
docker network connect --ip <IPv4> <red> <contenedor>
```

Desconectar un contenedor de una red:

```
docker network disconnect <red> <contenedor>
```
  