@echo off
setlocal enableDelayedExpansion

if [%3]==[] goto usage

SET DISTRO=%1
SET IMAGE=%2
SET WSL_PATH=%3

echo Exporting distro
docker run --name %DISTRO% -d %IMAGE%
docker export %DISTRO% -o %DISTRO%.tar

echo Stopping and unregistering WSL distro %DISTRO% (if any)
wsl -t %DISTRO%
wsl --unregister %DISTRO%
SET DISTRO_PATH=%WSL_PATH%\%DISTRO%
mkdir %DISTRO_PATH%
wsl --import %DISTRO% %DISTRO_PATH% %DISTRO%.tar

echo Cleanup...
docker rm %DISTRO%
del %DISTRO%.tar

echo Setting default distro to %DISTRO%
wsl -s %DISTRO%

goto :eof

:usage
  echo Usage: %0 DISTRO_NAME IMAGE WSL_PATH
  echo Example:
  echo     %0 CentOS-7 centos:latest C:\wsl
  exit /B 1