---
title: "Servidae: Log Analysis in ELK [WriteUp en Español]"
aliases:
  - guia servidae
  - servidae walkthrough
draft: "false"
tags:
  - WriteUp
  - TryHackMe
  - ELK
  - SIEM
---
# Task 1. Introduction
En esta room se usará Kibana para analizar los logs de una estación de trabajo comprometida. En las Tasks de esta room se explorarán los componentes de ELK y se hará uso del apartado Discover en Kibana. Adicionalmente, lo que se encuentre se relacionará con los indicadores de compromiso (IOCs) definidos por el framework [MITRE ATT&CK](https://attack.mitre.org/).
## Objetivos

- Familiarizarse con los componentes de ELK.
- Comprender la importancia del análisis de logs a la hora de detectar e investigar incidentes de ciberseguridad.
- Familiarizarse con Kibana para analizar logs.
- Adquirir experiencia en el análisis de logs para identificar amenazas y anomalías de seguridad reales.
## Prerrequisitos
- Conocimientos generales sobre Windows. [Windows Fundamentals module.](https://tryhackme.com/module/windows-fundamentals)
- Conocimientos generales sobre los SIEM y su uso. [Introduction to SIEM](https://tryhackme.com/room/introtosiem).

# Task 2. The Elastic Stack
Elastic Stack (anteriormente conocido como ELK Stack) es un conjunto de componentes open-source desarrollados por [Elastic](https://www.elastic.co/). Consiste en 4 productos:

- **Elasticsearch.** Es un motor de búsqueda y análisis distribuido, diseñado para almacenar e indexar datos. Su sistema permite almacenar y buscar diversos tipos de datos, incluyendo datos estructurados, no estructurados y semiestructurados. Elasticsearch se basa en Apache Lucene y proporciona una API REST sencilla para indexar, buscar y analizar datos. En un entorno SOC típico, un analista podría usar Elasticsearch para almacenar e indexar logs de seguridad, como los logs del firewall, para agilizar la búsqueda y el análisis.
- **Logstash.** Herramienta de ingesta y procesamiento de datos que se utiliza principalmente para recopilar, procesar y transformar datos de diversas fuentes y prepararlos para su almacenamiento en Elasticsearch u otros sistemas. Está diseñado para gestionar diversos tipos de datos, incluyendo registros, métricas, eventos y otros datos estructurados o no estructurados. 
- **Kibana.** Interfaz gráfica que permite crear paneles interactivos, visualizaciones e informes basados ​​en los datos almacenados en Elasticsearch. Además de la capacidad de buscar y filtrar eventos de registro, Kibana admite diversos gráficos para informes y visualización.
- **Beats.** Son componentes ligeros que transportan y recopilan diversos tipos de datos de diferentes fuentes (endpoints). Se instalan en las máquinas a monitorizar en lugar de en el servidor que aloja el SIEM. Aunque no son obligatorios, aportan capacidades de recopilación de datos eficientes y seguras. Hay distintos tipos de Beat que se usarán dependiendo del caso:
	- **Filebeat.** Logs y otros tipos de datos.
	- **Metricbeat.** Métricas del sistema.
	- **Packetbeat.** Datos de red.
	- **Winlogbeat.** Event logs de Windows.
	- **Auditbeat.** Datos de auditoría de Linux.
	- **Heartbeat.** Monitorización de conexión.

![[elastic_stack.png]]
## Respuestas

**What is the name of the open-source search engine library that Elasticsearch is built on?**

*Se puede ver subrayado que la biblioteca open-source en la que se basa Elasticsearch es Apache Lucene.*

![[task2ans1.png]]

>[!todo]- Revelar respuesta
>```flag
>Apache Lucene
>```

**Which component of the Elastic Stack would you use to perform advanced filtering and processing of data before it gets stored?**

*El encargado de filtrar y procesar los datos antes de ser guardados es logstash.*


![[task2ans2.png]]

>[!todo]- Revelar respuesta
>```flag
>Logstash
>```

# Task 3. A Compromised Workstation: Scenario
# Task 4. Kibana: Basics
## Respuestas

**Update the date and time filter as specified. How many total hits were captured within the selected time period?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>920
>```

# Task 5. Kibana: Fields and Values
## Respuestas

**Look at the Top values under the destination.ip field. Which IP address stands out?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>84.237.252.156
>```

**Use an IP address lookup tool (such as iplocation.io). What country does this IP address originate from?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>Latvia
>```

**Which process name is running the most frequently on the compromised workstation?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>curl.exe
>```

# Task 6. Kibana: Sorting and Filtering
## Respuestas

**What was the process ID (PID) of the potentially malicious PowerShell script?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>6712
>```

**What was the parent process name of the process that spawned powershell.exe?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>explorer.exe
>```

# Task 7. Indicators of Compromise: Discovery
## Respuestas

**What is the domain name of the attacker's server hosting the winPEAS executable?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>evilparrot.thm
>```

**What is the full path of the HKEY_LOCAL_MACHINE registry entry that was queried?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer
>```

# Task 8. Indicators of Compromise: Privilege Escalation
## Respuestas

**What is the name of the malicious .msi file?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>adminshell.msi
>```

# Task 9. Indicators of Compromise: Persistence
## Respuestas

**What is the name of the user account that the attacker created to maintain privileged access?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>backdoor
>```

**What is the flag sent via cURL requests to the evilparrot.thm server?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>THM{C4N_y0U_h34r_m3}
>```

**What is the name of the registry value that the attacker added?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>BackdoorShell
>```

# Task 10. Indicators of Compromise: Lateral Movement
## Respuestas

**What is the name of the user account that the attacker created to maintain privileged access?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>Password123!
>```

**What flag was included within the HTTP requests during the attacker's successful logins?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>THM{1m_1N_Y0ur_P4YR0LL}
>```

**What was the session cookie value that the attacker included in the cURL request at 18:58:08.001?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>dt5qhq423goknmq269rg1tal1a
>```

**What is the name of the sensitive file that the attacker downloaded?**

*Explicación*

>[!todo]- Revelar respuesta
>```flag
>bank-details.csv
>```

# Task 11. Conclusion
