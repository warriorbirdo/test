@echo off
setlocal

set USER=usuarioF
set PASSWORD=passwordF
set REPO_URL=URL_DEL_REPOSITORIO

:: Cambia al directorio del repositorio
cd "C:\ruta\al\repositorio"

:: Realiza el git pull
git pull https://%USER%:%PASSWORD%@%REPO_URL% main

endlocal
