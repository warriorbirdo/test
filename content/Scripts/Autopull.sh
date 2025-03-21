#!/bin/bash

USER="shadow_birdo"
PASSWORD="passwordF"
REPO_URL="https://git.potatohub.es/Ciberseguridad"

# Cambia al directorio del repositorio
cd /home/usuario/gitDocs/Ciberseguridad || exit

# Realiza el git pull
git pull https://$USER:$PASSWORD@$REPO_URL main

# Inicia Obsidian en segundo plano, directorio que aparece en obsidian.desktop
/opt/Obsidian/obsidian &
