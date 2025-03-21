[[Home]]/[[CETI]]

#### Índice
1. 

#### Apuntes
NORMATIVA
Gestión de evide

UNE 71505:2013 - Gestión de Evidencias Electrónicas

  
Generación. Como los logs que son generados automáticamente en windows, etc. (es una preparación previa)

Almacenamiento. En un sitio seguro.

Transmisión. Todas las veces que  cambie de manos debe ser detallado.

Recuperación. 

Tratamiento.  (o análisis)

Comunicación. (Entendible para cualquier persona a la que se dirija el informe mientras que el informe sí será técnico).

  

Todos los pasos tienen que cumplir:

  

- Cadena de  custodia digital. (Toda las fases tienen que estar controladas)
    
- Confiabilidad.
    

- Autenticación e integridad.
    
- Disponibilidad.
    
- Cumplimiento y gestión.
    

- Trazabilidad.
    
- Verificación.
    
- Gestión de la identidad.
    

  

  

Documentación: Justificación, auditable, repetible y/o reproducible.

Repetible: Mismos procedimientos y métodos producen el mismo resultado.

Reproducible: Cambio los métodos por unos equivalentes y me da el mismo resultado.

  
  

UNE 71506:2013 - Informática Forense

UNE 197010:2015 - Criterios generales para la elaboración de informes y dictámenes

  

14/10/2024

SGEE -> Sistemas de Gestión de Evidencias Electrónicas

- Gestión de identidades
    
- Trazabilidad de procesos
    
- Almacenamiento y custodia seguros
    

  

Se usa una matriz de funciones (tabla) como SGEE.

SSJJ -> Servicios Jurídicos

SSII ->Servicios Informáticos

  

Cadena de custodia

  

Términos fundamentales

- Integridad
    
- Autorización
    
- Autenticación
    

  
  

21/10/24
#### Forensic Tools
[https://github.com/clingeric/forensic-toolkit](https://github.com/clingeric/forensic-toolkit) 

FTKImager - Herramienta

FatCat

Dcfldd

NTFS

Hdparm

ShellBays

  
  

sudo dcfldd conv=sync,noerror bs=512 if=/dev/sdb hash=md5,sha512 hashwindow=100M

md5log=/home/kali/pruebaddd/md5.txt sha512log=/home/kali/pruebaddd/sha512.log

hashconv=after of=/home/kali/pruebaddd/copiaA1.img of=/home/kali/pruebaddd/copiaA2.img

of=/home/kali/pruebaddd/copiaA3.img

  

Disco duro vacio:

dd if=/dev/zero off=/home/kali/Desktop/usb/discoUSB.dd bs=1M count=100


#### dcfldd
sudo dcfldd conv=sync,noerror bs=512 if=/dev/sdb hash=md5,sha512 hashwindow=100M md5log=/home/kali/pruebaddd/md5.txt sha512log=/home/kali/pruebaddd/sha512.log hashconv=after of=/home/kali/pruebaddd/copiaA1.img of=/home/kali/pruebaddd/copiaA2.img of=/home/kali/pruebaddd/copiaA3.img

Disco duro vacio:  

dd if=/dev/zero off=/home/kali/Desktop/usb/discoUSB.dd bs=1M count=100