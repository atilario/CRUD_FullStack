@echo off
cd /d "%~dp0"
echo ===================================================================
echo   INICIANDO AMBIENTE DOCKER (CRUD FULLSTACK + MYSQL)
echo ===================================================================
echo.
docker compose up --build -d
if %errorlevel% neq 0 (
    echo.
    echo [ERRO] Ocorreu uma falha ao iniciar os containers.
    echo Verifique se o Docker Desktop esta aberto e tente novamente.
    echo.
    pause
    exit /b %errorlevel%
)

echo.
echo Containers iniciados com sucesso!
echo - Aplicacao Web: http://localhost:3000
echo - MySQL (Host): localhost:3307
echo.
echo Abrindo aplicacao no seu navegador...
timeout /t 3 /nobreak >nul
start http://localhost:3000
echo.
echo Para ver os logs em tempo real: docker compose logs -f
echo Para parar os containers: docker-parar.bat
echo ===================================================================
pause
