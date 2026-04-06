
[![Docker image](https://img.shields.io/badge/Docker-image-blue.svg)](https://hub.docker.com/repository/docker/kaedeair/baidunetdisk)
[![AMD64](https://img.shields.io/badge/arch-amd64-blue?style=flat-square&logo=linux)](#)
[![Docker Size](https://img.shields.io/docker/image-size/kaedeair/baidunetdisk)](https://hub.docker.com/r/kaedeair/baidunetdisk)
[![Docker Pulls](https://img.shields.io/docker/pulls/kaedeair/baidunetdisk)](https://hub.docker.com/r/kaedeair/baidunetdisk)

### English | [简体中文](./README.zh-CN.md)

# Docker image for Baidunetdisk

Baidunetdisk running inside container with VNC/Web access

## Features
* Service management via S6-Overlay
* Window management using FluxBox
* Minimal privileges

## Usage

### Docker CLI

 ```shell
 docker run -d \
   --name baidunetdisk \
   --security-opt no-new-privileges \
   --cap-add SETGID \
   --cap-add SETUID \
   --cap-add CHOWN \
   --cap-add DAC_OVERRIDE \
   --cap-drop ALL \
   -e VNC_PASSWORD=<vnc_password> \
   -e GEOMETRY=<resolution> \
   -e PUID="$(id -u)"  \
   -e PGID="$(id -g)"  \
   -v <host_mount_directory>:/app \
   -p 8080:8080 \
   -p 5900:5900 \
   kaedeair/baidunetdisk:latest
 ```

### Docker Compose
See`docker-compose.yml` for detail

### Environment Variables

| Variable     | Description             | Default Value |
|--------------|-------------------------|---------------|
| VNC_PASSWORD | VNC connection password | ""            |
| GEOMETRY     | Screen resolution       | 1280x720      |
| PUID         | UID the app runs as     | 1000          |
| PGID         | GID the app runs as     | 1000          |

### Data Persistence

| Mount Point | Description         |
|-------------|---------------------|
| /app        | User configurations |

### Ports

| Port | Description |
|------|-------------|
| 8080 | Web UI      |
| 5900 | VNC         |



