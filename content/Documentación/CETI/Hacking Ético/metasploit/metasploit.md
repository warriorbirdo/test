[[Home]]/[[CETI]]/[[Hacking Ético]]

sudo msfdb init

  

iniciar base de datos reinit si queremos reiniciar o start si la hemos hecho init alguna vez.

  

sudo msfvenom

  

Crear malware

  

sudo msfconsole

  

entrar en la consola del framework

  

primero de todo db_status para comprobar la base de datos.

  

db_nmap para guardar en la base de datos los resultados de ese nmap.

  

search (Servicio) para buscar exploits disponibles para el servicio puedes añadir exploit o la versión para que la búsqueda sea más concreta. 

  

Para usarlo escribimos use y el número que nos ha proporcionado o si ha sido mucho antes el nombre entero “exploit/windows/ftp/freftpd_pass”

  

con show payloads podemos encontrar los payloads disponibles, pero si no escribes nada por defecto hace uno, si necesitaras uno distinto podríamos usar set payload (payload).

  

con show options podemos ver las opciones de este exploit, es decir los requerimientos para el ataque.

  

con set RHOSTS ; set FTPUSER ; set OPCIÓN podemos configurar las opciones del exploit para el ataque si volvemos a escribir show options podemos ver como están actualmente.

  

Se puede mandar el exploit escribiendo exploit en la consola

  

si usamos check y está permitido en el exploit nos dice si cree que es susceptible al ataque.

  

si funciona y entramos en la shell meterpreter podemos escribir help y encontrar los comandos específicos para escalar privilegios u obtención de información de esta shell.

  

mediante background podemos guardar la sesión en background y salir y entrar más fácilmente mediante sessions (número de la sesión).

  

con vulvs y host puedes ver tanto las vulnerabilidades como los host usados.

  

con db_stats podemos ver lo que hemos encontrado de esta sesión.

  

podemos también usar auxiliarys para encontrar vulnerabilidades o encontrar contraseñas por fuerza bruta.

  

mediante search auxiliary podemos encontrarlo ademas de añadiendo lo que queramos buscar.

  

Un encoder es algo que ofusca la información es decir esconde el exploit para que no lo detecte el antivirus.

  

Otra herramientas también usada es cobalt strike pero una licencia es bastante cara.