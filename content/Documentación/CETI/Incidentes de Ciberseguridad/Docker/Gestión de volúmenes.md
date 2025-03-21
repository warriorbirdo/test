[[Home]]/[[CETI]]/[[Incidentes de ciberseguridad]]/[[Docker]] | [Oficial](https://docs.docker.com/reference/cli/docker/volume/) | [Almacenamiento](https://docs.docker.com/engine/storage/#volume-mounts)

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
