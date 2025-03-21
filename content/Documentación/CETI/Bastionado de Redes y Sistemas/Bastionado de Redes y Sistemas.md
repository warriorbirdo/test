[[Home]]/[[CETI]]

#### Índice
1. 

  
#### Primer día
60 Examen 40 Trabajos o 50/50 Examen/Trabajos.

  

1 micro SD + de 64 Gb velocidad de escritura de 80 Mb/s.

1 Usb viejo de 1/2 de Gb.

  

Debian linux para la micro SD.

Fedora linux.

  

Que usaremos y porque![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfhe1v1U-BgfgVWzfAbnAW5ArUygBbYs3k67Wh65mIMbP6FHXOiirdG8ZZUo_TOIOIc8_bgsotIIggfoXBwsbzBHIPdEgM1aCxKadgU8WMk2wTsMWBLd4O-ackoB7nuDHKBWph6ewH1vpvwBk_9BMVQXMGv?key=Dec3MUz_lu3Mc31l9Q9ADQ)

Los técnicos de AT&T crearon el sistema operativo UNIX para facilitar el uso de los primeros ordenadores.

  

IBM popularizó MSDOS debido al uso doméstico haciéndolo más común.

  

Luego se creó Windows cubriendo el mercado doméstico y sustituyendo el resto.

  

Debido a lo anterior UNIX  casi desapareció del mercado pero gracias a Richard Stallman y un equipo que reunió de forma completamente gratuita lo usaron para crear un sistema operativo más útil para todos los usuarios. Creando las bases para en un futuro Linus Torvalds creara el núcleo que finalmente se unieron las dos partes GNU por parte de Richard y Linux por parte de Linus. 

  
  
  

# INSTALACIÓN DE DEBIAN

  

a314-cet01 kiko

a314-cet02 Fran

  

clave superuser: maled0r

  

usuario

usuaria

  

Una vez instalado debian y en la interfaz no gráfica (alt+control+F4 o F5) entramos en superusuario y:

  

nano /etc/apt/sources.list (también existe “joe” como procesador de texto)

añadir “contrib” y “non-free” con nano a la primera línea DEB antes de “non-free-firmware” y comentar la segunda.

  
  

apt update (cargar la lista de paquetes disponibles)

apt install nvidia-tesla-470-driver

  

SERVIDORES QUITAR TIENDA DE SOFTWARE POR PELIGRO DE UPDATE AUTOMÁTICA.
#### Análisis de riesgos

- 1. Robo de equipo.
    

- 1.1. Robo de credenciales.
    
- 1.2. Acceso a datos sensibles.
    

- 2. Uso no autorizado.
    
- 3. Olvido de la contraseña.
    
- 4. Avería hardware.
    

- 4.1. Daño componentes.
    
- 4.2. Pérdida de datos.
    

- 5. Robo de datos en local.
    
- 6. Robo de credenciales.
    

Soluciones

- Robo de equipo:
    

- Mecanismos de fijación.
    
- Vigilancia del entorno.
    
- Localizador.
    

- Uso no autorizado:
    

- Contraseña segura.
    
- Bloqueo de sesión.
    
- No usar contraseña.
    

- Llaves criptográficas.
    
- Datos biométricos.
    
- Certificados.
    

- Olvido de la contraseña.
    

- Gestor de contraseñas.
    

-  BBDD encriptada.
    
- Dispositivo de almacenamiento de contraseñas.
    

- Recuperación 2FA.
    

- Avería Hardware.
    

- Copia de seguridad.
    

- Acceso desde otro SO.
    

- Establecer contraseña en la BIOS.

  
#### Cifrados
 1. BitLocker (Windows)

Ventajas:

  1. Integrado en versiones profesionales y empresariales de Windows, lo que facilita su configuración.

  2. Ofrece cifrado de disco completo, incluyendo particiones del sistema.

  3. Se puede integrar con TPM (Trusted Platform Module), añadiendo una capa extra de seguridad.

  

Desventajas:

  1. Solo disponible en las ediciones profesionales y empresariales de Windows, no en versiones domésticas.

  2. Dependiente del hardware (TPM) para un uso óptimo.

  3. La recuperación de datos puede ser complicada si se pierde la clave de recuperación.

  
  

 2. VeraCrypt (multiplataforma)

Ventajas:

  1. Multiplataforma: disponible para Windows, macOS y Linux.

  2. Es de código abierto, lo que permite auditorías de seguridad independientes.

  3. Permite el cifrado de particiones completas o de archivos individuales.

  

Desventajas:

  1. Puede ser complejo de configurar para usuarios no avanzados.

  2. La velocidad de cifrado y descifrado es más lenta en comparación con opciones nativas como BitLocker.

  3. No ofrece soporte oficial, lo que puede ser un problema en caso de dificultades técnicas.

  
  

 3. FileVault (macOS)

Ventajas:

  1. Integrado en macOS, facilitando su uso y configuración para usuarios de Apple.

  2. Ofrece cifrado de disco completo con un impacto mínimo en el rendimiento del sistema.

  3. Se puede utilizar junto con iCloud para recuperar la clave de cifrado.

  

Desventajas:

  1. Solo disponible para sistemas macOS, lo que lo limita a un ecosistema específico.

  2. Si se olvida la contraseña y no se tiene una clave de recuperación o acceso a iCloud, es imposible recuperar los datos.

  3. No es personalizable, lo que puede ser una limitación para usuarios avanzados.

  
  

 4. dm-crypt con LUKS (Linux)

Ventajas:

  1. Es la opción de cifrado nativa en muchas distribuciones de Linux.

  2. Altamente configurable, lo que permite personalizar el nivel de seguridad y el tipo de cifrado.

  3. Ofrece cifrado de disco completo y compatibilidad con múltiples algoritmos de cifrado.

  

Desventajas:

  1. Puede ser complicado de configurar para usuarios sin experiencia en Linux.

  2. La recuperación de datos es difícil si se pierde la clave de cifrado.

  3. No es compatible con sistemas Windows o macOS, lo que puede ser una limitación en entornos multiplataforma.

  
  
  

 5. AES Crypt (multiplataforma)

Ventajas:

  1. Fácil de usar, con una interfaz simple para cifrar archivos individuales.

  2. Multiplataforma: funciona en Windows, macOS, Linux y también tiene una versión móvil.

  3. Usa el algoritmo de cifrado AES-256, considerado altamente seguro.

  

Desventajas:

  1. No ofrece cifrado de disco completo, solo cifrado de archivos individuales.

  2. No tiene opciones avanzadas de configuración, lo que puede ser limitante para algunos usuarios.

  3. No está tan ampliamente auditado como otras soluciones más conocidas como VeraCrypt.

  
  

Cada uno de estos sistemas tiene características distintas que pueden ser útiles según el entorno y las necesidades del usuario.