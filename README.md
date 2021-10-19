# Linux Distro for WSL

> Reference: [Import any Linux distribution to use with WSL](https://docs.microsoft.com/en-us/windows/wsl/use-custom-distro)

## Quick Start

```bat
REM Build container image for distro (e.g. CentOS-8) and tag it `wsl-distro`
docker build CentOS-8 -t wsl-distro

REM Import WSL distro
import-distro.bat CentOS-8 wsl-distro D:\WSL
```

## Useful Scripts

```sh
# To allow passwordless su
sed -i '/^#auth.*pam_wheel.so trust use_uid/s/^#//' /etc/pam.d/su
```
