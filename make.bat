@ECHO OFF

pushd %~dp0

if "%DOCKERCMD%" == "" (
	set DOCKERCMD=docker
)

if "%1" == "" goto help

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

:end
popd
