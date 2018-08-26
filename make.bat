@ECHO OFF

pushd %~dp0

if "%DOCKERCMD%" == "" (
	set DOCKERCMD=docker
)

if "%1" == "" goto help
if "%1" == "build" goto build
if "%1" == "remove" goto remove
if "%1" == "quickstart" goto quickstart
if "%1" == "bash" goto bash

%DOCKERCMD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'docker' command was not found. Make sure you have Docker
	echo.installed and the daemon is running.
	echo.
	exit /b 1
)

%DOCKERCMD% run --rm -it --name sphinx -v %~dp0/doc:/doc sphinx:latest %1
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
%DOCKERCMD% run --rm -it --name sphinx -v %~dp0/doc:/doc --entrypoint "sphinx-quickstart" sphinx:latest
goto end

:bash
%DOCKERCMD% run --rm -it --name sphinx -v %~dp0/doc:/doc --entrypoint "/bin/bash" sphinx:latest
goto end

:end
popd
