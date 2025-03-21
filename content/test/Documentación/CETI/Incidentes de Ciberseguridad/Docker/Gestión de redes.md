[[Home]]/[[CETI]]/[[Incidentes de ciberseguridad]]/[[Docker]] | [Oficial](https://docs.docker.com/reference/cli/docker/network/)

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
  