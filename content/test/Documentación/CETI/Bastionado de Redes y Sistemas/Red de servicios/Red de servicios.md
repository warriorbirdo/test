## Pasarela
##### 1. Configurar dos NIC: una en modo red interna y otra en modo adaptador puente.
##### 2. Instalar Debian sin entorno gráfico.
##### 3. Instalar paquetes necesarios.
```bash 
apt install -y ssh openssh-server iptables net-tools
```
##### 4. En `/etc/sysctl.conf` descomentar `net.ipv4.ip_forward=1`.
##### 5. Editar `/etc/network/interfaces`.
```bash
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enp0s3
iface enp0s3 inet static
	address 172.16.0.1
	netmask 255.255.0.0
	
# External NIC
auto enp0s8
iface enp0s8 inet dhcp
	post-up iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE
	pre-down iptables -t nat -D POSTROUTING -o enp0s8 -j MASQUERADE
```
![[Pasted image 20250216150433.png]]
##### 6. Reiniciar servicio de red.
```bash
systemctl restart networking.service
```
### iptables
##### 1. Editar archivo. En caso de no existir, generarlo.
```bash
nano /usr/local/bin/iptables-save
```
```bash
# Limpiar tablas
iptables -F
iptables -t nat -F

# NAT para la red interna
iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE

# Redirección de puertos

## pasarela (ssh:22)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

## apache (http:80 ssh:2201)
iptables -t nat -A PREROUTING -i enp0s8 -p tcp --dport 80 -j DNAT --to-destination 172.16.0.10:80
iptables -A FORWARD -i enp0s8 -o enp0s3 -p tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -i enp0s8 -p tcp --dport 2201 -j DNAT --to-destination 172.16.0.10:22
iptables -A FORWARD -i enp0s8 -o enp0s3 -p tcp --dport 2201 -j ACCEPT

## firebird (tcp:3050 ssh:2202)
iptables -t nat -A PREROUTING -i enp0s8 -p tcp --dport 2202 -j DNAT --to-destination 172.16.0.20:22
iptables -A FORWARD -i enp0s8 -o enp0s3 -p tcp --dport 2202 -j ACCEPT

## flamerobin (rdp:3389 ssh:2203)
iptables -t nat -A PREROUTING -i enp0s8 -p tcp --dport 3389 -j DNAT --to-destination 172.16.0.30:3389
iptables -A FORWARD -i enp0s8 -o enp0s3 -p tcp --dport 3389 -j ACCEPT
iptables -t nat -A PREROUTING -i enp0s8 -p tcp --dport 2203 -j DNAT --to-destination 172.16.0.30:22
iptables -A FORWARD -i enp0s8 -o enp0s3 -p tcp --dport 2203 -j ACCEPT

# Denegar el resto del tráfico entrante
iptables -t filter -P INPUT DROP

```
![[Pasted image 20250216150725.png]]
##### 2. Cargar reglas.
```bash
iptables-save > /etc/iptables/rules.v4
```
##### 3. Cargar reglas al inicio del sistema.
```bash
nano /etc/rc.local
```
```bash
#!/bin/bash
iptables-save > /etc/iptables/rules.v4
```
![[Pasted image 20250216154859.png]]
```bash
chmod +x /etc/rc.local
```
## Apache
##### 1. Configurar NIC en modo red interna
##### 2. Instalar Debian sin entorno gráfico.
##### 3. Instalar paquetes necesarios.
```bash
apt install -y ssh openssh-server apache2
```
##### 4.  Editar `/etc/network/interfaces`.
```bash
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enp0s3
iface enp0s3 inet static
	address 172.16.0.10
	netmask 255.255.0.0
	gateway 172.16.0.1

```
![[Pasted image 20250216155330.png]]
##### 5. Reiniciar servicio de red.
```bash
systemctl restart networking.service
```
## Firebird
##### 1. Configurar NIC en modo red interna
##### 2. Instalar Debian sin entorno gráfico.
##### 3. Instalar paquetes necesarios.
```bash
apt install -y ssh openssh-server firebird3.0-server
```
##### 4. En `/etc/firebird/3.0/firebird.conf` descomentar `RemoteServicePort = 3050` y cambiar `#RemoteBindAddress = ` por `RemoteBindAddress = 0.0.0.0`.
##### 5. Editar `/etc/network/interfaces`. 
```bash
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enp0s3
iface enp0s3 inet static
	address 172.16.0.20
	netmask 255.255.0.0
	gateway 172.16.0.1
```
![[Pasted image 20250216155812.png]]
##### 6. Reiniciar servicio de red y firebird.
```bash
systemctl restart networking.service firebird3.0.service
```

## Flamerobin
##### 1. Configurar NIC en modo red interna
##### 2. Instalar Debian sin entorno gráfico.
##### 3. Instalar paquetes necesarios.
```bash
apt install -y ssh openssh-server flamerobin gnome
```
##### 4. Editar `/etc/network/interfaces`.
```bash
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enp0s3
iface enp0s3 inet static
	address 172.16.0.30
	netmask 255.255.0.0
	gateway 172.16.0.1
```
![[Pasted image 20250216160034.png]]
##### 5. Reiniciar servicio de red.
```bash
systemctl restart networking.service
```
##### 6. Iniciar el entorno gráfico.
```bash
systemctl restart gdm
```
##### 7. Configurar gnome para que no entre en suspensión tras un periodo de inactividad.
![[Pasted image 20250212130117.png]]
##### 8. Activar el escritorio remoto.
![[Pasted image 20250210170620.png]]
##### 9. Activar FlameRobin al encender la máquina.
![[Pasted image 20250210170735.png]]