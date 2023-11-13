@REM ----------------------------------------------------------------------------
@REM Licenciado para a Apache Software Foundation (ASF) sob um
@REM ou mais acordos de licença do contribuinte. Consulte o arquivo NOTICE
@REM distribuído com este trabalho para obter informações adicionais
@REM sobre a propriedade dos direitos autorais. A ASF licencia este arquivo
@REM para você sob a Licença Apache, Versão 2.0 (a
@REM "Licença"); você não pode usar este arquivo exceto em conformidade
@REM com a Licença. Você pode obter uma cópia da Licença em
@REM
@REM    https://www.apache.org/licenses/LICENSE-2.0
@REM
@REM A menos que seja exigido por lei aplicável ou acordado por escrito,
@REM o software distribuído sob a Licença é distribuído em um
@REM BASE "COMO ESTÁ", SEM GARANTIAS OU CONDIÇÕES DE QUALQUER
@REM TIPO, expresso ou implícito. Consulte a Licença para o
@REM idioma específico que rege permissões e limitações
@REM sob a Licença.
@REM ----------------------------------------------------------------------------

@REM ----------------------------------------------------------------------------
@REM Script de Inicialização do Maven
@REM
@REM Variáveis de Ambiente Obrigatórias:
@REM JAVA_HOME - localização do diretório principal do JDK
@REM
@REM Variáveis de Ambiente Opcionais:
@REM M2_HOME - localização do diretório principal instalado do Maven
@REM MAVEN_BATCH_ECHO - definir como 'on' para habilitar a exibição dos comandos do lote
@REM MAVEN_BATCH_PAUSE - definir como 'on' para aguardar uma tecla antes de encerrar
@REM MAVEN_OPTS - parâmetros passados para a Máquina Virtual Java ao executar o Maven
@REM     por exemplo, para depurar o próprio Maven, use
@REM set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
@REM MAVEN_SKIP_RC - sinal para desativar o carregamento de arquivos mavenrc
@REM ----------------------------------------------------------------------------

@REM Iniciar todas as linhas REM com '@' caso MAVEN_BATCH_ECHO esteja 'on'
@echo off
@REM definir título da janela de comando
title %0
@REM habilitar a exibição definindo MAVEN_BATCH_ECHO como 'on'
@if "%MAVEN_BATCH_ECHO%" == "on"  echo %MAVEN_BATCH_ECHO%

@REM definir %HOME% para equivalente a $HOME
if "%HOME%" == "" (set "HOME=%HOMEDRIVE%%HOMEPATH%")

@REM Executar um script definido pelo usuário antes deste
if not "%MAVEN_SKIP_RC%" == "" goto skipRcPre
@REM verificar o script anterior, uma vez com a extensão legada .bat e uma vez com a extensão .cmd
if exist "%HOME%\mavenrc_pre.bat" call "%HOME%\mavenrc_pre.bat"
if exist "%HOME%\mavenrc_pre.cmd" call "%HOME%\mavenrc_pre.cmd"
:skipRcPre

@setlocal

set ERROR_CODE=0

@REM Para isolar variáveis internas de possíveis scripts posteriores, usamos outro setlocal
@setlocal

@REM ==== INÍCIO DA VALIDAÇÃO ====
if not "%JAVA_HOME%" == "" goto OkJHome

echo.
echo Erro: JAVA_HOME não encontrado em seu ambiente. >&2
echo Por favor, defina a variável JAVA_HOME em seu ambiente para corresponder ao >&2
echo local da sua instalação Java. >&2
echo.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto init

echo.
echo Erro: JAVA_HOME está definido para um diretório inválido. >&2
echo JAVA_HOME = "%JAVA_HOME%" >&2
echo Por favor, defina a variável JAVA_HOME em seu ambiente para corresponder ao >&2
echo local da sua instalação Java. >&2
echo.
goto error

@REM ==== FIM DA VALIDAÇÃO ====

:init

@REM Encontrar o diretório base do projeto, ou seja, o diretório que contém a pasta ".mvn".
@REM Voltar para o diretório de trabalho atual se não encontrado.

set MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%
IF NOT "%MAVEN_PROJECTBASEDIR%"=="" goto endDetectBaseDir

set EXEC_DIR=%CD%
set WDIR=%EXEC_DIR%
:findBaseDir
IF EXIST "%WDIR%"\.mvn goto baseDirFound
cd ..
IF "%WDIR%"=="%CD%" goto baseDirNotFound
set WDIR=%CD%
goto findBaseDir

:baseDirFound
set MAVEN_PROJECTBASEDIR=%WDIR%
cd "%EXEC_DIR%"
goto endDetectBaseDir

:baseDirNotFound
set MAVEN_PROJECTBASEDIR=%EXEC_DIR%
cd "%EXEC_DIR%"

:endDetectBaseDir

IF NOT EXIST "%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config" goto endReadAdditionalConfig

@setlocal EnableExtensions EnableDelayedExpansion
for /F "usebackq delims=" %%a in ("%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config") do set JVM_CONFIG_MAVEN_PROPS=!JVM_CONFIG_MAVEN_PROPS! %%a
@endlocal & set JVM_CONFIG_MAVEN_PROPS=%JVM_CONFIG_MAVEN_PROPS%

:endReadAdditionalConfig

SET MAVEN_JAVA_EXE="%JAVA_HOME%\bin\java.exe"
set WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
set WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

set DOWNLOAD_URL="https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"

FOR /F "tokens=1,2 delims==" %%A IN ("%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties") DO (
    IF "%%A"=="wrapperUrl" SET DOWNLOAD_URL=%%B
)

@REM Extensão para permitir o download automático do maven-wrapper.jar do Maven-central
@REM Isso permite o uso do wrapper maven em projetos que proíbem a verificação de dados binários.
if exist %WRAPPER_JAR% (
    if "%MVNW_VERBOSE%" == "true" (
        echo Encontrado %WRAPPER_JAR%
    )
) else (
    if not "%MVNW_REPOURL%" == "" (
        SET DOWNLOAD_URL="%MVNW_REPOURL%/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"
    )
    if "%MVNW_VERBOSE%" == "true" (
        echo Não foi possível encontrar %WRAPPER_JAR%, fazendo o download ...
        echo Fazendo o download de: %DOWNLOAD_URL%
    )

    powershell -Command "&{"^
		"$webclient = new-object System.Net.WebClient;"^
		"if (-not ([string]::IsNullOrEmpty('%MVNW_USERNAME%') -and [string]::IsNullOrEmpty('%MVNW_PASSWORD%'))) {"^
		"$webclient.Credentials = new-object System.Net.NetworkCredential('%MVNW_USERNAME%', '%MVNW_PASSWORD%');"^
		"}"^
		"[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $webclient.DownloadFile('%DOWNLOAD_URL%', '%WRAPPER_JAR%')"^
		"}"
    if "%MVNW_VERBOSE%" == "true" (
        echo Download de %WRAPPER_JAR% concluído
    )
)
@REM Fim da extensão

@REM Fornecer uma maneira "padronizada" de obter os argumentos da CLI que
@REM funcionará tanto com execuções do Windows quanto não do Windows.
set MAVEN_CMD_LINE_ARGS=%*

%MAVEN_JAVA_EXE% %JVM_CONFIG_MAVEN_PROPS% %MAVEN_OPTS% %MAVEN_DEBUG_OPTS% -classpath %WRAPPER_JAR% "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" %WRAPPER_LAUNCHER% %MAVEN_CONFIG% %*
if ERRORLEVEL 1 goto error
goto end

:error
set ERROR_CODE=1

:end
@endlocal & set ERROR_CODE=%ERROR_CODE%

if not "%MAVEN_SKIP_RC%" == "" goto skipRcPost
@REM verificar o script posterior, uma vez com a extensão legada .bat e uma vez com a extensão .cmd
if exist "%HOME%\mavenrc_post.bat" call "%HOME%\mavenrc_post.bat"
if exist "%HOME%\mavenrc_post.cmd" call "%HOME%\mavenrc_post.cmd"
:skipRcPost

@REM pausar o script se MAVEN_BATCH_PAUSE estiver definido como 'on'
if "%MAVEN_BATCH_PAUSE%" == "on" pause

if "%MAVEN_TERMINATE_CMD%" == "on" exit %ERROR_CODE%

exit /B %ERROR_CODE%
