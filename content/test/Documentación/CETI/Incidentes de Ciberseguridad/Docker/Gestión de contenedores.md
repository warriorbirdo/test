[[Home]]/[[CETI]]/[[Incidentes de ciberseguridad]]/[[Docker]] | [Oficial](https://docs.docker.com/reference/cli/docker/container/)

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
