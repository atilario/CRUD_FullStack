@echo off
cd /d "%~dp0"
echo ===================================================================
echo   PARANDO CONTAINERS DOCKER
echo ===================================================================
echo.
docker compose down
echo.
echo Containers finalizados com sucesso!
echo ===================================================================
pause
