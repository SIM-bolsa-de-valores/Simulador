@REM ----------------------------------------------------------------------------
@REM Licenciado para a Apache Software Foundation (ASF) sob um
@REM ou mais acordos de licença de contribuidores. Consulte o arquivo NOTICE
@REM distribuído com este trabalho para obter informações adicionais
@REM sobre a propriedade dos direitos autorais. A ASF licencia este arquivo
@REM para você sob a Licença Apache, Versão 2.0 (a
@REM "Licença"); você não pode usar este arquivo exceto em conformidade
@REM com a Licença. Você pode obter uma cópia da Licença em
@REM
@REM    https://www.apache.org/licenses/LICENSE-2.0
@REM


@REM ----------------------------------------------------------------------------
@REM Script de Inicialização do Maven
@REM
@REM Variáveis de ambiente obrigatórias:
@REM JAVA_HOME - localização do diretório home do JDK
@REM
@REM Variáveis de ambiente opcionais:
@REM M2_HOME - localização do diretório home instalado do maven2
@REM MAVEN_BATCH_ECHO - definir como 'on' para habilitar a exibição dos comandos em lote
@REM MAVEN_BATCH_PAUSE - definir como 'on' para esperar por uma tecla antes de encerrar
@REM MAVEN_OPTS - parâmetros passados para a JVM Java ao executar o Maven
@REM     por exemplo, para depurar o Maven em si, use
@REM set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
@REM MAVEN_SKIP_RC - sinalizador para desabilitar o carregamento de arquivos mavenrc
@REM ----------------------------------------------------------------------------

@REM Inicie todas as linhas REM com '@' caso MAVEN_BATCH_ECHO esteja definido como 'on'
@echo off
@REM defina o título da janela de comando
title %0
@REM habilite a exibição definindo MAVEN_BATCH_ECHO como 'on'
@if "%MAVEN_BATCH_ECHO%" == "on"  echo %MAVEN_BATCH_ECHO%

@REM defina %HOME% como equivalente a $HOME
if "%HOME%" == "" (set "HOME=%HOMEDRIVE%%HOMEPATH%")

@REM Execute um script definido pelo usuário antes deste
if not "%MAVEN_SKIP_RC%" == "" goto skipRcPre
@REM verifique o script pré, uma vez com a extensão .bat antiga e uma vez com a extensão .cmd
if exist "%HOME%\mavenrc_pre.bat" call "%HOME%\mavenrc_pre.bat"
if exist "%HOME%\mavenrc_pre.cmd" call "%HOME%\mavenrc_pre.cmd"
:skipRcPre

@setlocal

set ERROR_CODE=0

@REM Para isolar as variáveis internas de possíveis scripts posteriores, usamos outro setlocal
@setlocal

@REM ==== INÍCIO DA VALIDAÇÃO ====
if not "%JAVA_HOME%" == "" goto OkJHome

echo.
echo Erro: JAVA_HOME não encontrado em seu ambiente. >&2
echo Por favor, defina a variável JAVA_HOME em seu ambiente para coincidir com o >&2
echo localização da sua instalação Java. >&2
echo.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto init

echo.
echo Erro: JAVA_HOME está definido para um diretório inválido. >&2
echo JAVA_HOME = "%JAVA_HOME%" >&2
echo Por favor, defina a variável JAVA_HOME em seu ambiente para coincidir com o >&2
echo localização da sua instalação Java. >&2
echo.
goto error

@REM ==== FIM DA VALIDAÇÃO ====

:init

@REM Encontre o diretório base do projeto, ou seja, o diretório que contém a pasta ".mvn".
@REM Recorra ao diretório de trabalho atual se não for encontrado.

set MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%
SE NÃO "%MAVEN_PROJECTBASEDIR%"=="" VÁ para endDetectBaseDir

set EXEC_DIR=%CD%
set WDIR=%EXEC_DIR%
:findBaseDir
SE EXISTIR "%WDIR%"\.mvn VÁ para baseDirFound
cd ..
SE "%WDIR%"=="%CD%" VÁ para baseDirNotFound
set WDIR=%CD%
VÁ para findBaseDir

:baseDirFound
set MAVEN_PROJECTBASEDIR=%WDIR%
cd "%EXEC_DIR%"
VÁ para endDetectBaseDir

:baseDirNotFound
set MAVEN_PROJECTBASEDIR=%EXEC_DIR%
cd "%EXEC_DIR%"

:endDetectBaseDir

SE NÃO EXISTIR "%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config" VÁ para endReadAdditionalConfig

@setlocal HabilitarExtensões HabilitarDelayedExpansion
for /F "usebackq delims=" %%a em ("%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config") faça set JVM_CONFIG_MAVEN_PROPS=!JVM_CONFIG_MAVEN_PROPS! %%a
@endlocal & set JVM_CONFIG_MAVEN_PROPS=%JVM_CONFIG_MAVEN_PROPS%

:endReadAdditionalConfig

SET MAVEN_JAVA_EXE="%JAVA_HOME%\bin\java.exe"
set WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
set WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

set DOWNLOAD_URL="https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"

PARA /F "tokens=1,2 delims==" %%A IN ("%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties") FAÇA (
    SE "%%A"=="wrapperUrl" SET DOWNLOAD_URL=%%B
)

@REM Extensão para permitir o download automático do maven-wrapper.jar do Maven-central
@REM Isso permite o uso do wrapper do Maven em projetos que proíbem a verificação de dados binários.
se existir %WRAPPER_JAR% (
    se "%MVNW_VERBOSE%" == "true" (
        echo Encontrado %WRAPPER_JAR%
    )
) else (
    se não "%MVNW_REPOURL%" == "" (
        SET DOWNLOAD_URL="%MVNW_REPOURL%/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"
    )
    se "%MVNW_VERBOSE%" == "true" (
        echo Não foi possível encontrar %WRAPPER_JAR%, fazendo o download ...
        echo Fazendo download de: %DOWNLOAD_URL%
    )

    powershell -Command "&{"^
		"$webclient = new-object System.Net.WebClient;"^
		"se (-not ([string]::IsNullOrEmpty('%MVNW_USERNAME%') -and [string]::IsNullOrEmpty('%MVNW_PASSWORD%'))) {"^
		"$webclient.Credentials = new-object System.Net.NetworkCredential('%MVNW_USERNAME%', '%MVNW_PASSWORD%');"^
		"}"^
		"[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $webclient.DownloadFile('%DOWNLOAD_URL%', '%WRAPPER_JAR%')"^
		"}"
    se "%MVNW_VERBOSE%" == "true" (
        echo Download de %WRAPPER_JAR% concluído
    )
)
@REM Fim da extensão

@REM Forneça uma maneira "padronizada" de recuperar os argumentos da CLI que
@REM funcionará tanto com execuções do Windows quanto não do Windows.
set MAVEN_CMD_LINE_ARGS=%*

%MAVEN_JAVA_EXE% %JVM_CONFIG_MAVEN_PROPS% %MAVEN_OPTS% %MAVEN_DEBUG_OPTS% -classpath %WRAPPER_JAR% "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" %WRAPPER_LAUNCHER% %MAVEN_CONFIG% %*
se ERRORLEVEL 1 VÁ para error
VÁ para end

:error
set ERROR_CODE=1

:end
@endlocal & set ERROR_CODE=%ERROR_CODE%

se não "%MAVEN_SKIP_RC%" == "" VÁ para skipRcPost
@REM verificar o script pós, uma vez com a extensão .bat antiga e uma vez com a extensão .cmd
se existir "%HOME%\mavenrc_post.bat" call "%HOME%\mavenrc_post.bat"
se existir "%HOME%\mavenrc_post.cmd" call "%HOME%\mavenrc_post.cmd"
:skipRcPost

@REM pause o script se MAVEN_BATCH_PAUSE estiver definido como 'on'
se "%MAVEN_BATCH_PAUSE%" == "on" pause

se "%MAVEN_TERMINATE_CMD%" == "on" exit %ERROR_CODE%

exit /B %ERROR_CODE%
