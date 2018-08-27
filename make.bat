@ECHO OFF

pushd %~dp0

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

if "%1" == "" goto help
if "%1" == "build" goto build
if "%1" == "remove" goto remove
if "%1" == "quickstart" goto quickstart
if "%1" == "bash" goto bash

%DOCKERCMD% run --rm -it --name sphinx -v %~dp0/doc:/doc flatlining/sphinx:latest %1
goto end

:help
%DOCKERCMD% run --rm -it -v %~dp0/doc:/doc sphinx:latest help
goto end

:build
%DOCKERCMD% build -t sphinx:latest .
goto end

:remove
%DOCKERCMD% container rm sphinx
goto end

:quickstart
mkdir doc
%DOCKERCMD% run --rm -it --name sphinx -v %~dp0/doc:/doc --entrypoint "sphinx-quickstart" sphinx:latest
goto end

:bash
%DOCKERCMD% run --rm -it --name sphinx -v %~dp0/doc:/doc --entrypoint "/bin/bash" sphinx:latest
goto end

:end
popd
