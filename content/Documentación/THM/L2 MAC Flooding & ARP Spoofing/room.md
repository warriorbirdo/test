Capturar tráfico en la terminal
```shell
tcpdump -A -i eth1 -w /tmp/*pcap
```
- `-A` Traduce el tráfico a ASCII.
- `-i` Selecciona la interfaz.
- `-w` Escribe los resultados a un archivo.

MAC Flooding
```shell
macof -i eth1
```
- `-i` Selecciona la interfaz.


ARP poisoning
```bash
ettercap -T -i eth1 -M arp
```
- `-T` Especifica que Ettercap debe ejecutarse en modo texto.    
- `-i eth1` Selecciona la interfaz
- `-M arp` Selecciona el modo de operación `arp`. Indica que Ettercap debe realizar envenenamiento ARP (Address Resolution Protocol).