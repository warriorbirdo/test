cambiar ram para docker en linux de forma temporal:

“sudo sysctl -w vm.max_map_count=262145”

  

cambiar ram para docker en linux para que siempre inicie así:

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdHr8K1c2O03cbrG2wtNW3DW4vaqZjELDYyORSNZZCosu7yE_1VsiVNZh1QDBGQl7SYw5EUWnn6HngmNm3PqiWv19YmasQlOjoT9seoY0IyrGYfZ5OuLwEHYwKkVKxYYw7yhdSp?key=ZcswW9QIIjd9_v7o5WjP1OcB)

  

comando para instalarlo con un docker:

  

“docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk:7.16.3”

  

puertos:

  

Indexa y guarda datos (base de datos) Elasticshell 9200

Filtra, parsea datos (antes de guardar) Logstash 5044

Visualiza (interfaz gráfica) Kibana 5601

  
  

comando de docker para la práctica sin docker compose

  

“docker run --network elk-red --ip 172.20.0.10 -p 5601:5601 -p 9200:9200 -p 5044:5044 -it -d --name elk sebp/elk:7.16.3”

  

Con docker compose:

  

nano docker-compose.yml

  

Es muuuuuuuy importante la indentación demasiado quejica

  

y escribimos:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeBMTyCnOcye_tOdzfjioHB8kzto-BYe7nO00ZykZl6argK50nrrSRqyCGPYOmKvdZ849RlFRrTv3WbD0KUqsWocQqlR8xdWYWclZboqK5jqbtt881HBi195_Ts-sU5MvS9-sU0zw?key=ZcswW9QIIjd9_v7o5WjP1OcB)

  

para crearlo usamos el siguiente comando:

  

docker-compose up -d

  

Instalar filebeat 7.16.3

Primero añadimos el repositorio con:

echo "deb [https://artifacts.elastic.co/packages/7.x/apt](https://artifacts.elastic.co/packages/7.x/apt) stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

Añadimos el repositorio a la lista de keys válidas:

wget -qO - [https://artifacts.elastic.co/GPG-KEY-elasticsearch](https://artifacts.elastic.co/GPG-KEY-elasticsearch) | sudo apt-key add -

Luego actualizamod con:

sudo apt update

Y finalmente instalamos con:

sudo apt-get install filebeat=7.16.3

Una vez instalado lo ponemos para que se inicie siempre con:

sudo systemctl enable filebeat

Y empezamos el servicio con:

sudo systemctl enable filebeat

Configurar archivos /etc/filebeat/filebeat.yml

Están en moodle con sus direcciónes

darle permisos al certificado es importante si da problemas con:

chmod 644 <archivo>

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd02oPGZGGHpBdWyG4-yFR67-Y3Uh2HpbVEPVjW1hWV_T5zKKR5XHK5p5ZUddaAbfR6s1iI1653NwWJVf5vclISR5gNYoffvts_Aw0vVKDFIXW4iN10a9525vZ_D4uBEkiZ08uIvA?key=ZcswW9QIIjd9_v7o5WjP1OcB)

  

Creamos un índice para filebeat con lo siguiente: el asterisco hace que coja cualquier cosa que coincida con lo escrito.  
![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdquJp_B45eZww6lu0oAEd9oOg7Wf5Z0S5YzX27MQfO2paIzPPK3R6HNATHNRFA-U5JHOP8eZyit_QDdZLVebV7muEff28NCRd7a3nTD50QU8GqdvVtyCrcSnRsISWaK4U9lBoRLg?key=ZcswW9QIIjd9_v7o5WjP1OcB)

Ahora en discover nos aparecerán todos los datos

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe12dWGQJv9-zCrnBvv7swl9Q9FsFGDcSLYm5qqHuR1zlCoqiPv7mO8evqU0ZSkJfHSBHMKZGouG01P5svWTiuhH6eKhMjsLCh-8pFyek9D7zTBA6hiK4q57wKxmV_8qFXeQHenCA?key=ZcswW9QIIjd9_v7o5WjP1OcB)heartbeat-elastic

Metricbeat

Packetbeat

AuditBeat