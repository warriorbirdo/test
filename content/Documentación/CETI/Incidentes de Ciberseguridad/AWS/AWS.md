AWS

EC2 - Elastic Cloud Computing [IaaS - Infrastructure as a Service]

  

IaaS es como una máquina virtual que te permite hacer lo que quieras.

PaaS término medio.

SaaS tiene todo montado. GMail

  

Instancias - Listado de máquinas virtuales en la nube cuando se hayan lanzado

Para lanzar instancias le damos al botón naranja.

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfEeavIjX8-yatW0qVZ6nptotkZoLMpCExMKNPbfptbh70D_YRLFImwPqwfauxoHcInfYS5D_1DZ1thXF---pY6aAp75jmMSF9r25c2Jolo-Cvjxi6PEMeWepOl5LyKzgQ6esvKQw?key=AhInUo2NY6h7vQP2oArJEzx3)

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdsgR8Z8Cv5lTaZIwaoEgOWFGimqMEbxa48Ku3kzaXd5I20laKEHE5R-6NrQmfVzV_J43_I53yufLTf0MJhHSjhMIix5IDNqWrN-JXSTF_o5ycfyYr3jdmpnLWBC6Wl3QBr6gmS?key=AhInUo2NY6h7vQP2oArJEzx3)

  

Clave rsa para powershell:

$ sudo chmod 400 CETI.pem [para que solo pueda usar la clave el usuario]

Para windows:

icacls "path\to\your\file" /inheritance:r /grant:r yourusername:R

  

Comando ssh:

ssh -i <archivo.pem> ec2-user@3.230.54.24

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfZYgCcgnH-FDr2YfmPOPX_F-X3tm1vt9aNC1C-MtgHaBAg-buSe1x5svF4SmITdd1fzqStcQEQA8WCza1ke8DbW3FOIFgNYXbD41QNvH-9T4cu_3FbG8gE4z-idoFu-ZagqiV7RQ?key=AhInUo2NY6h7vQP2oArJEzx3)

Editar firewall

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcXdrmG3xjIHnEvNDeVb7uEt8O_6cLRT2TAJwNyTFczo_E41b3u1pkAcYtnhUgZjxv9N5fJ99l8oFXJfzAjS5bzxjU2uMSSolL2gyl-yYVz4rj3nIrKbU6H_dE1vfWtzdOjPSGwDQ?key=AhInUo2NY6h7vQP2oArJEzx3)

  
  
  
  

IP elástica es IP fija

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd1tBoJyt3axUfnM25QNRD-22jnBHRaVVF9JlBXSln-LroVqdOZOAS0d4mG4w-Vnj_KAvPgXg6rq8I0EATATYnI-5bh5xBZJoowjv9lMvf-Q4qM0vCKE5qS488V_BTJ6BDbIplX?key=AhInUo2NY6h7vQP2oArJEzx3)

  

Conexión de urgencia  
![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc-it2-rxf3WoCcSB3fQFVZ0nqu01JUXFjR4gxS5upMFnZAo_eJAY3hh6jWNcHo5NGIzCR1N7oXt7flrycAaBuZa79BEtcge-426aHjnqvH-xCjt0YsH_WQ2ZG9PFWsHwHL6Jrriw?key=AhInUo2NY6h7vQP2oArJEzx3)

Conectar > Conexión de la instancia EC2 > Conectar

  

Activa, habilita de 

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfgXJq01Tuq2v6rt3agVzbcdLI3S57m7O723Rcs9NIaC5U8yE9KRkvwQAa_-xPY-9n6hIsJP_ECG3ovfPWts_Qh1KlyW6mlbC6UDvkt7giT8HvyDS9ySvJuY10hPSGyo1xFulJnng?key=AhInUo2NY6h7vQP2oArJEzx3)

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeUsfJtL-zGYoRCteYzje9nI945J6hKgCnPJ7myFbi5MusfEkNvzWGb6_K6y82F7pJcXsoYQnsACVoRy0CphYnG2gb5c_8vnNJNxpU3zcJ-28bChwISBuuwAB3ANXU6zybTkggc?key=AhInUo2NY6h7vQP2oArJEzx3)

  

[https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9](https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9) 

  

Instalar docker

  

sudo dnf install docker -y

  

Iniciar docker

sudo systemctl start docker

  

Que docker se inicie con la maquina

sudo systemctl enable  docker

  

Dar permiso al usuario para docker para no tener que poner sudo

sudo usermod -a -G docker ec2-user

  
  

Instalar docker compose  
  
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

Fix permissions after download:

sudo chmod +x /usr/local/bin/docker-compose

Verify success:

docker-compose version

  

Para los clientes hay que activar lo siguiente al crearla:

  

Trafico http  
![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf45SZvizRgBgUV1etyMX8WO4tRo9sYJ1yqvF5VNQS5RtRd-cbLn6-RcRAE5BoiVr2NYxjsEtRQEMFg4fpPUIEql_cm7J8tjGX9bFSyV0Q6NW7_sscPWB8pTGOMnll5Jf_mnyZC9A?key=AhInUo2NY6h7vQP2oArJEzx3)

ssh para entrar a la de ubuntu

ssh -i E:\Fran\CETI.pem ubuntu@44.202.42.74

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeESbAi-2zPyz27KLIgxuXj6rIDB0BbC85m_BM3AJFfXm--yizqz2ObGZikN-obivLkcUixnu09MjrVoIKMK_svjfIpAxMOilWixu10pb74tBi9N0xXaijNutBOH--KUh4lfc5Y0A?key=AhInUo2NY6h7vQP2oArJEzx3)