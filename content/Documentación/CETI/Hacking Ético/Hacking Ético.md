[[Home]]/[[CETI]]

#### Índice

1. [[nmap]]
2. [[netcat]]
3. [[telnet]]
4. [[metasploit]]
5. [[aircrack-ng]]

#### Repaso

ÍNDICE

  

[REDES 2](https://docs.google.com/document/d/1DVD3j-7bnHZWtPbHTo8PoPWhD9ah1Z427PVAOQ6jFog/edit#heading=h.k953fdqaew0o)

[WEB 3](https://docs.google.com/document/d/1DVD3j-7bnHZWtPbHTo8PoPWhD9ah1Z427PVAOQ6jFog/edit#heading=h.kbpcujfpva3i)

 REDES

Direccionamiento según capas OSI:![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf7fcRd55KOiG6Xv8hrP4YLz73i0wMc5irJow882TyifFsxZoNBdyQPVNezdUtniTXPQWtE8ma6Iv5cdd1pGb12jOBL6Gx3l2Vnfoa0cEMRjta8V-HC48HQMLi-QD1BlxfjTHnH1r5pAlXbFxdMfVGjRCaM?key=wToLT5PEt_xRqLSK3z0-RQ)

  

Aplicación Servicios.

Transporte Puertos.

Internet Dirección IPv4 o IPv6.

Acceso a la red Dirección MAC.

  

Protocolos:

Aplicación HTTPS, DNS,DHCP, FTP, SMTP,SSH, TELNET.

Transporte TCP(Lento con confirmación), UDP(Rápido sin confirmación).

Internet IP.

Acceso a la red IEEE 802.3 Ethernet, IEEE 802.11 WIFI.

  
  

 WEB

URL: “[https://dominio:puerto](about:blank)” (no sale el puerto si es el por defecto del protocolo)

  

Puertos: http (80) https (443)

![[Repaso.png]]

  

 Resumen

Test de penetración (pentest) => auditorías

#### Fases y herramientas del pentest

##### Fases

  

PTES (Penetration Testing Execution Standard)

[http://www.pentest-standard.org/index.php/Main_Page](http://www.pentest-standard.org/index.php/Main_Page) 

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdWiedHkmKtO84ul5ykUxvr8Ns8caaw54gnlnL3xvSB200MOSw14NZBUHdNWRNakU_rIRtMr5suoeBLbjEep8TWXtgBQwWF3OwDOyYwa09IQ760heaQ-QS0RKO0tBvgst5W26KndgilhSsKoTbBsIhZsHg6?key=q1VLoEP6LTuDE9f6Tc7zNQ)

  

Pre-engagement Interactions: Decidir las condiciones y objetivos de nuestro pentest. El alcance.  Obtener un SOW (Statement of Work)

  

Footprinting o Intelligence Gathering: Encontrar toda la información posible a través de internet sin que el objetivo se entere. [Whois](https://www.dondominio.com/es/whois/), [Shodan](https://www.shodan.io/), The harvester, Hunter.io, Domaindossier, etc. Usando OSINT (Open Source Intelligence).

  

Fingerprinting o Threat Modeling: Podemos ser detectados, empezamos a usar Nmap, Nessus, OpenVAS, gobuster, burpsuite, etc. Descubrimos: 

- Que sistema operativo y nivel de parche.
    
- Aplicaciones y nivel de parcheo.
    
- Puertos abiertos.
    
- Servicios en ejecución.
    
- Cuentas de usuario.
    

  

Vulnerability Analysis: Analizar las vulnerabilidades de lo encontrado.

- CVE (Common Vulnerabilities and Exposures) = Identificador de la vulnerabilidad
    
- CVSS (Common Vulnerability Scoring System) = Puntuación de la vulnerabilidad (Si no tiene aún no ha sido analizada)
    

↓ Opcional ↓

---

Exploitation: Aprovechar la vulnerabilidad

  

Post Exploitation: Crear más vulnerabilidades a partir de ella. (Gracias a la escalada de privilegios u otros modos).

---

↑ Opcional ↑

Reporting:  Creación de un informe.

##### Herramientas

Objetivos:

  

Conocer herramientas y relacionarlas con las distintas fases del pentest. Aprender el manejo de estas.

  
  
  
  

Shodan usa un crawler que lee los archivos de sitemap.xml o site.txt  
  
  
  
  
Metodología TryHackMe

  

mkdir [room_name]

IP=[room_ip]

nmap && room_ip en el navegador

Kali trae wordlists en /usr/share

  

Primera técnica de explotación:

  

Reverse Shell:

  

[https://github.com/pentestmonkey/php-reverse-shell](https://github.com/pentestmonkey/php-reverse-shell)

  

Subiremos un archivo que ejecutará un código, en la maquina abriremos un terminal y usaremos un listened (netcan) y escribiremos “nc -lvp 2222”

  

Editamos el PHP reverse shell y ponemos la IP de la máquina (vpn) y el puerto que usaremos y cambiamos la terminación para camuflarlo un poco.

  

luego usamos find / -type f -name user.txt para ver los usuarios por ejemplo

  

para escalada de privilegios usamos find / -user root -perm /4000 2>/dev/null/ para encontrar archivos root que pueden usarse con un usuario sin privilegios.

  

0 -> stdin

1-> stdout

2->stderr  
  
Escalada de privilegios : [https://gtfobins.github.io/gtfobins/python/](https://gtfobins.github.io/gtfobins/python/)

#### Vulnerabilidades

Vulnerabilidades = Debilidad

- Tipos:
    

- Diseño (HTTP, Telnet, WPA/WEP)
    
- Implementación (SQL Injection)
    
- Uso (Post-It)
    
- Zero-day (Vulnerabilidad explotada previa a su comunicación)
    
- Buffer Overflow
    
- Race condition
    
- Error de cadena
    
- XSS (Cross Side Scripting)
    
- SQL Injection
    
- DoS
    
- Window Spoofing (Iframe)
    

  

- Etapas:
    

- Nacimiento
    
- Descubrimiento
    
- Comunicación
    
- Corrección
    
- Publicación
    
- Exploit
    
- Muerte
    

  

- Caracterización:
    

- CVE (Common Vulnerabilities and Exposures) => Código
    
- CVSS (Common Vulnerabilities Scoring System) => Nota
    

- Métricas base:
    

- AV (Access Vector) => L(ow)/A(djacent Network)/N(etwork)
    
- AC (Access Complexity) => H(igh)/M(edium)/L(ow)
    
- Au (Authentication) => M(ultiple)/S(ingle)/N(none)
    

- Métricas de impacto:
    

- C(onfidentiality) => N(one)/P(artial)/C(omplete)
    
- I(integrity) => N(one)/P(artial)/C(omplete)
    
- A(vailability) => N(one)/P(artial)/C(omplete)
    

- Métricas temporales:
    

- E (Explotability) => U(Unproven)/P(Proof-of-concept)/F(Functional)/H(High)/ND(NotDefined)
    
- RL (Remediation Level) => O(Official Fix)/T(Temporary Fix)/W(Workaround)/U(Unavailable)/ND(NotDefined)
    
- RC (Report Confidence) => UC(Unconfirmed)/UR(Uncorroborated)/C(Confirmed)/ND(NotDefined)
    

- CWE (Common Weakness Enumeration) => Grupo de CVEs
    

  

Herramientas

- Nessus
    
- OpenVAS
    
- Msframework
    
- Searchsploit
    
- CVE Details
    
- CVE Mitre
    
- NIST CVE
    
- INCIBE CVE
#### WiFi
WiFi, protocolo: IEEE 802.11 a/b/g/n/ac/ax

          1/2/3/4/5  /6 /6E  /7

  

Desde la a hasta la g tienen mala velocidad y cada salto era brutal en velocidad.

  

n/ac/ax velocidad  mejorada centrándose en IOT disminuyendo las colisiones de los mensajes de varios aparatos.

  
  

El wifi tiene la posibilidades de frecuencia: 2,4 Ghz y 5 Ghz

  

Protocolos de cifrado WiFi

  

- Sin cifrar.
    

- WEP. Wire Equivalent Privacy. Cifrado básico, el mismo que se usa para conectarte es el mismo para cifrar los datos. (Fasi)
    
- WPA. Wi-Fi Protected Access. La longitud no era muy larga y se puede sacar por fuerza bruta (horas y días), (algo más difisi).
    
- WPA2. Wi-Fi Protected Access 2. Se incrementó la longitud y ya la fuerza bruta no servía, ahora por diccionario o por listas específicas. (más difisi)
    
- WPA3. Wi-Fi Protected Access 3. (más difisi aún)
    

- WPA - PSK. Todos con la misma contraseña. (Doméstico) 
    

- Pros:
    

- Fácil de recordar e implementar en nuevos dispositivos.
    

- Contras:
    

- Difícil de cambiar en muchos dispositivos en el ámbito empresarial.
    
- Más fácil de filtrar.
    

- WPA - Enterprise. Te suele pedir un usuario y contraseña individual en un servidor de RADIUS (por persona)
    

- Pros:
    

- Cambios de contraseñas individuales.
    
- Facilidad en la monitorización.
    

- Contras:
    

- Tedioso para redes domésticas.
    
- Necesita servidor Radius.
    

Canales

![Canales WiFi: Guía completa con consejos para aumentar el rendimiento de la  señal. Usos, ventajas y desventajas de los rangos de 2,4 GHz, 5 GHz, 900 MHz](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcyvjZtPX7gugor1itDQKdxDaGJibt_jv8iCVnJETTXvt-FIl-OorMHGeZc8HN4_3DAkGjIl6Hpj-ko28e8qoK6fLiZa7RJU6sO6U1x1aDrv-O_YKP81zuG0DsAyBTEQ0hMkHLptw?key=aK5boE7toUMmENLIWDcQuPYN)

Distintas frecuencias a las que puede ir el WiFi para evitar interferencias.

  

Protocolos de autenticación

  
  

WPS

Protocolo para conectar un dispositivo fácilmente después de algún input.

  

Pin (QR). Al escanear un QR te conectas al wifi mandando un pin al dispositivo.

PBC (botón). Después de pulsar el botón es posible la conexión al wifi durante un tiempo  (2min).

NFC. Parecido al QR pero mediante RF generada por un campo magnético.

USB. Permite la conexión al tener las claves dentro del propio USB.

  

Monitor/Promiscuo

  

Modo en el que un dispositivo atrapa toda la información de la red Wifi.

  

MAC

Dirección física de un dispositivo.

  

A1:B2:C3:D4:E5:F6

  

Los primeros 3 campos es el fabricante y el resto el dispositivo.

  

Filtrado por MAC

  

Se pueden filtrar las conexiones a un router mediante una whitelist o blacklist usando las direcciones MAC de los dispositivos.