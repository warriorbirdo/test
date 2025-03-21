## Ejercicio 1

Primero crearemos tanto el Docker del servidor web como el docker con nmap, usaremos la versión de ubuntu:22.04, además es importante añadir al docker del servidor web el siguiente apartado en su comando de creación “--cap-add=NET_ADMIN” para poder configurar el cortafuegos.  Los comandos usados serán los siguientes:

  

HOST:

docker run -it -d --name HostK --cap-add=NET_ADMIN ubuntu:22.04

  

CLIENTE:

docker run -it -d --name ClienteK ubuntu:22.04

  

docker run: Creación de un contenedor usando una imagen.

-it: El contenedor creado será interactivo.

-d: El contenedor se crea en background permitiendo que se use de fondo.

--name: Asigna un nombre al contenedor

--cap-add=NET_ADMIN: Permite la configuración del firewall.

ubuntu:22.04: Imagen que usaremos en la creación del contenedor.

  

Para entrar en el docker usaremos el siguiente comando:

  

docker exec -it <nombre> /bin/bash

  

## Ejercicio 2

  

Instalamos las aplicaciones necesarias en cada contenedor.

### Cliente

  

Primero hacemos un “apt update” y luego instalamos nmap y knockd mediante “apt install nmap knockd -y”

### Host

Primero hacemos un “apt update” y luego instalamos nginx, ufw y knockd mediante “apt install  nginx ufw knockd  -y”

  

Finalmente en el Host comprobamos los servicios mediante “service --status-all”

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeutxCQKQqOeKhwVPm1ASsQHhK5Fh1MAjXgOmLJbXZpB6-WspR6oHssYWTYbelB15I6BguRrrBuGt7I09vmVB14gwEZmPBDAkR4rT5Jobaz-s3p9Mv6Nj-kyZutH-6AJ6uY58nV?key=yr6KghALVH5giljdWfOFTfI_)

  

Ahora activamos el nginx mediante “service nginx start” y luego en el cliente usamos el nmap dirigido al host “nmap -p 80 <IP HOSTK>”.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdvf-RFLgUis3XuC15veDgolhKgYNOAwyUAqlZpWgAbG-I33l-rm7tAixRDLJET3ll8AylBas4Ur9VnfJ7uhdn9aF76LIqkQGuJ3Z-TefO3dTzuS5DCH76ysgwcg91MS9bz0FVaZA?key=yr6KghALVH5giljdWfOFTfI_)

  

Para ver la ip del HostK podemos instalar el paquete para hacer “ip a” o en este caso usaremos en nuestra terminal “docker container inspect HostK”  y buscamos la ip, en este  caso es la 172.17.0.3.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfWHdg4-2ttQUdJ2TTPNhl5rrQhKC_0ei95fFNtFmVDfuU2G0PvIIa0za4UDHYpkyd4ogNp4mLVQYd1P8S9l5_MhwNVRIwdK5gILBaI7L5YmSAkACzyImU373-qyblqAsQLz8Cr?key=yr6KghALVH5giljdWfOFTfI_)

Este último comando nos da información sobre el contenedor de docker.

  

Finalmente hacemos el nmap y comprobamos que el puerto está abierto.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXexhVuJrtReaApbFmUbevYW-OG5NJQKe7ZRVrHebw0gVAXluODgezBMyuM2kVZwIVFsXfnc52T8IQULaYKsxC_VSn-zdvLfvHSAFWt5z0eheW7DkKuRD-Hl8jAoT1PIouS7qK8D8g?key=yr6KghALVH5giljdWfOFTfI_)

## Ejercicio 3

Para activar ufw primero usaremos el comando “ufw enable” donde iniciaremos el firewall y finalmente comenzamos el servicio con “service ufw start”.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfU7MIRZea9CY1nRzJiyLPJBDqXxO0zBHGGV08QiPLcUW41bcuAqxBm6qwqaarZax0S4e5B5nn_bmSn9xxmyNT7LuSDyt4CAbTGxRTPxVxuDIJjSM7Gp_ysUg_t9psW4M8IC9ZV?key=yr6KghALVH5giljdWfOFTfI_)

  

Comprobamos con “service --status-all”.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcJdOiyFO-nx3_H6uG8QdUZzb9Rzw3fco9lkSGI8u9ngY-UGq9LKJdB-YYWshGDo9drtIYGTCmy-EMgqgLnuBVlA_VOcVebBWjVaGUTy-1TSkEY80eEtLtls_6DiQIm2zWGHkbs?key=yr6KghALVH5giljdWfOFTfI_)

  

Ahora intentamos de nuevo el nmap con el cliente.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeXVnn-keFiyXoJk5U3eUG8ej1UB9KrBMsLyyv6iKFOKgqkangU0SkRV5KJaAhjvmNhxMBavYQ7JE6RD65On3Dh1z1QtkP_CneHOmqCKleldpLcftq0oAD5WvOfu8b3el41tcKCsg?key=yr6KghALVH5giljdWfOFTfI_)

  

Como se puede apreciar ahora el puerto aparece filtered por lo cual no está abierto a cualquier paquete que enviemos.

## Ejercicio 4

Usamos el comando "ufw allow from <IP-cliente> to any port 80" para permitir al cliente poder enviar paquetes al puerto 80 y posteriormente hacemos otro nmap.

  

Para obtener la ip también podemos usar “docker container inspect ClienteK”.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfY-cNML-tsU85u64VqvGG-dP_5XUZmQ4AIgmBPgLr9XO2a-0x5my-e2iJNXjXUl0hq53aAcR4_XqlZN8PNgsF-v4oWA8N5m9K8J31FYkiyWL_VV4fiLmHLmnq7Se1saWSx1KnVng?key=yr6KghALVH5giljdWfOFTfI_)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdeB4geqhPLLyfkrP3pVC8-EhDqbqxyym9Uaw7oQDXVHSAT5Q5_oCKggPysne7tugpr1eLU1NjkV45Kf_FxzbDy02XoGauqB7StZ676q0aPnWshuUN1Gzi9qUZbq3MpGQrDEnAJbQ?key=yr6KghALVH5giljdWfOFTfI_)

## Ejercicio 5

Usamos ahora el comando "ufw delete allow from 172.17.0.2 to any port 80" para borrar lo que anteriormente habilitamos y hacemos otro nmap para comprobar que el puerto ahora aparece cerrado.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcsVMONgD5UCbJPZAu8unlyFpqv9UOde7LSJWBZ64oCh2fIy2VtAD4cOJyB0JeFvGNVM4aYkebh9Ypo2Mi0i7-NlDOFnk5x87F25B6UnraLU23odR9NlziZMcUy8pnbg941PXtbuw?key=yr6KghALVH5giljdWfOFTfI_)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcWSNz3LJVxkOEN4R-0UeRRvOm2oomebrkkAS4t24b3v-MRSZIedv6QYbU3H6LGFbWeN2TiyyoxTeIqNCGnq-o3VWFyGjJRBG840HXNKVOxzHuxqLBxecahRiCtMQ4cr4pBAJt6FA?key=yr6KghALVH5giljdWfOFTfI_)

## Ejercicio 6

Ahora usaremos el servicio de knockd en el host y lo configuraremos (usaremos el que se cierra con el tiempo ya que lo veo más seguro), los pasos son los siguientes.

  

1º Tener instalado nano, si no, usaremos “apt install nano”.

  

2º Editamos el archivo de configuración situado en /etc/, usaremos el comando “nano /etc/knockd.conf”.

  

3º Usaremos la configuración del ejemplo 3 que nos proporciona la [página oficial.](https://help.ubuntu.com/community/PortKnocking#Server_Setup)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc434dNyPbx7qtevjrcB9o4j9EQE-gKT2a2uB20LN1YhBZKzdz6tRr9pSlfGNYl0eT_JloR8lC4U0rtwYywe-w9b9BNo0o8REJ2CqErigWtjNKQ0eVyPuV8TQeZLF-dYOq3COqf2Q?key=yr6KghALVH5giljdWfOFTfI_)

  

4º Editamos el archivo /etc/default/knockd, tiene que estar como en el siguiente ejemplo:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeqj1ZjTA3Jmsopqo-o0CWqXV-cO6jNr2b2kg2XMZZrMpLYaGprqp4fyqdFlb14WSlRAmHF3EMTDDrySiay0mtgIwZHB0Uw-oi9375S0t5V3VXjkMNiP6f96rzjiZ58lsqv-YjxdQ?key=yr6KghALVH5giljdWfOFTfI_)

  

5º Activamos el servicio con “service knockd start”.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfe78kAcXyfsl14FHrLyH_kchWJB4xpBWZF-rE2nKVanT3SUBuDHp_QU-bU2DFEwy11UM52WTlkFyX3e-cN24H4gvxKyHBoNov5PpiHC9ase-KnACfcoDoAvGd1lvaVOJoxXirj?key=yr6KghALVH5giljdWfOFTfI_)

6º Comprobamos que el servicio está activo con “service --status-all”.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeaeecgQ8H5EwKqsYa12KcnbX3XMIpiz6iV1LkNERJNeQ7g0nWJJu0bUnqmVLvGmevzaXYuyFUYWOhp_Brsm-5jZwo971VcmrAvJG2FXyrkhNRQD7W98HN7tCtEFOznAvdBTgD4sw?key=yr6KghALVH5giljdWfOFTfI_)

## Ejercicio 7

En este caso probaremos a hacer un nmap antes y después del knocking, debido a que cambiamos la máquina para este punto volvemos a comprobar con “docker container inspect HostK” la ip de nuestro objetivo.

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcaKQD_v3S9oI_-RMkuZf511N7tq5ZtXKbYUbsoWUAZzyUwcm8i0a7zRRYy0SaPUhX4wuQqBAVfBHnU1dHTlCyaJihGHPLBOTPXofT2jUzxJ2RL-24GEuN6l-531m_AYAVmf6Y8CA?key=yr6KghALVH5giljdWfOFTfI_)

Ahora la ip correspondiente al HostK es la 172.17.0.2, por lo que usaremos esa.

  

Primero probamos con un “nmap -p 80 172.17.0.2” debido al ufw que activamos previamente nos saldrá filtrado, en este caso no podríamos acceder, sin embargo después de usar el comando “knock -v 172.17.0.2 7000 8000 9000” nos abrira durante el tiempo que configuremos el puerto 80 a nuestra ip, y al hacer el siguiente nmap aparece como abierto como se puede ver.

## ![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeXMjyN3Kcfq3uxg4Zt2FDHKZXv3sknBCSP5lzeCKGM904S8W1PSxIIpglZCaqr6FOiA3J35KZUydHQy6HSKh7uwVashelhkP__y5EV5QRwhb2QlLIc-5-QlsvrsRkde93B7gg-4Q?key=yr6KghALVH5giljdWfOFTfI_)

Como vemos a continuación 3 minutos después el puerto aparece filtrado de nuevo.

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeHRtlRNu_kztq7IGz8ZmcUpVxy1Uhy5CvnnOMXCMPmE01HtOvHMnK3CxXjbeK6pk1TAUTsM2RaYnQDIINbyEN-pIDM_B82LaoumcKFZ5PI36UJAgVoguQzkzxcs1XAAijUwd-dlA?key=yr6KghALVH5giljdWfOFTfI_)