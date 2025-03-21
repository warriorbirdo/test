## **Guía de uso de git**

#### Configuración inicial

```bash
git config --global user.name "Your Name"
```
 
```bash
git config --global user.email "you@example.com"
```

*Alternativamente se puede editar el archivo `.gitconfig` que se encuentra en el directorio home.*

#### Inicialización del repositorio

Desde la carpeta en la que se desee inicializar el repositorio local se usará el siguiente comando:

```bash
git init
```

Añadir la dirección del repositorio en la nube.
```bash
git remote add origin https://git.potatohub.es/Ciberseguridad
```

Establecer main en lugar de master.
```bash
git branch -M main
```


#### Gestión del repositorio

Añadir todo el repositorio al commit.
```bash
git add .
```

Escribir los cambios realizados al repositorio local. El mensaje debe indicar los cambios realizados.
```bash
git commit -m "mensaje"
```

Eliminar un commit del repositorio local.
```bash
git reset <mode> <commit>
```

mode:
- `--soft` &rarr; Borra los el commit, pero no los archivos.
- `--mixed` &rarr; Borra el commit y los archivos.

commit:
- `HEAD~x` &rarr; Borra x commits con respecto al HEAD.

Restaurar un archivo o directorio eliminado que se estaba presente en el último commit.
```bash
git restore <archivo>
```
*En lugar del archivo, se puede usar ./ para restaurar todo el repositorio.* 

Hacer un push (subir los archivos) a la rama main.
```bash
git push -u origin main
```

Hacer un pull (descargar los archivos) a la rama main.
```bash
git pull origin main
```

#### Gestión de conflictos

Si hubiese conflictos, se puede crear un stash. Esto permite hacer un pull sin sobrescribir los archivos locales.

```bash
#1
git stash

#2
git pull origin main

#3
git stash pop
```

Al usar el tercer comando, git preguntará al usuario sobre el tratamiento de los conflictos encontrados entre los datos en el repositorio local y `origin`.

#### Referencias externas

- [Tutorial Atlassian](https://www.atlassian.com/git/tutorials/saving-changes)
