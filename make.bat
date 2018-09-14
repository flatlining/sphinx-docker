@ECHO OFF

pushd %~dp0

if "%CONTAINER%" == "" (
	set CONTAINER=sphinx
)
if "%IMAGE%" == "" (
	set IMAGE=sphinx
)
if "%DISTIMAGE%" == "" (
	set DISTIMAGE=flatlining/sphinx
)
if "%DOCKERCMD%" == "" (
	set DOCKERCMD=docker
)

%DOCKERCMD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The '%DOCKERCMD%' command was not found. Make sure you have Docker
	echo.installed and the daemon is running.
	exit /b 1
)

if "%1" == "" goto end
if "%1" == "build" goto build
if "%1" == "tag" goto tag
if "%1" == "bash" goto bash

goto end

:build
%DOCKERCMD% image build -t %IMAGE% .
goto end

:tag
%DOCKERCMD% image tag %IMAGE% %DISTIMAGE%
goto end

:bash
%DOCKERCMD% container run --rm -it --name %CONTAINER% -v %~dp0/doc:/doc --entrypoint "/bin/bash" %IMAGE%
goto end

:end
popd
