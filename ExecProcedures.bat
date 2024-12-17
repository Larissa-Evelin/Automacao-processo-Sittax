@echo off
setlocal enabledelayedexpansion

rem Caminho onde estão os scripts SQL
set "diretorio=C:\Users\Larissa\Downloads\Scripts1\Scripts"

rem Informações de conexão
set "server=DEVSRV"
set "database=QA01"
set "username=sa"
set "password=********"

rem Loop para rodar todos os scripts .sql
for %%F in (%diretorio%\*.sql) do (
    echo Executando %%F
    sqlcmd -S %server% -d %database% -U %username% -P %password% -i "%%F"
    if !errorlevel! neq 0 (
        echo Erro ao executar %%F
        exit /b %errorlevel%
    )
)

echo Todos os scripts foram executados com sucesso!
pause
