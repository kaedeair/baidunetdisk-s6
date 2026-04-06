
[![Docker image](https://img.shields.io/badge/Docker-image-blue.svg)](https://hub.docker.com/repository/docker/kaedeair/baidunetdisk)
[![AMD64](https://img.shields.io/badge/arch-amd64-blue?style=flat-square&logo=linux)](#)
[![Docker Size](https://img.shields.io/docker/image-size/kaedeair/baidunetdisk)](https://hub.docker.com/r/kaedeair/baidunetdisk)
[![Docker Pulls](https://img.shields.io/docker/pulls/kaedeair/baidunetdisk)](https://hub.docker.com/r/kaedeair/baidunetdisk)

### [English](./README.md) | 简体中文

# 百度网盘Docker镜像

容器内运行百度网盘，支持VNC/Web访问

## 特性
* 通过S6-Overlay管理服务
* 使用FLuxBox管理窗口
* 最小化权限

## 使用方法

### 命令行

 ```shell
 docker run -d \
   --name baidunetdisk \
   --security-opt no-new-privileges \
   --cap-add SETGID \
   --cap-add SETUID \
   --cap-add CHOWN \
   --cap-add DAC_OVERRIDE \
   --cap-drop ALL \
   -e VNC_PASSWORD=<VNC密码> \
   -e GEOMETRY=<分辨率> \
   -e PUID="$(id -u)"  \
   -e PGID="$(id -g)"  \
   -v <宿主机挂载目录>:/app \
   -p 8080:8080 \
   -p 5900:5900 \
   kaedeair/baidunetdisk:latest
 ```

### 容器编排
详见`docker-compose.yml`

### 环境说明

| 变量名          | 描述           | 默认值      |
|--------------|--------------|----------|
| VNC_PASSWORD | VNC密码        | 空        |
| GEOMETRY     | 分辨率          | 1280x720 |
| PUID         | 应用运行所使用的用户ID | 1000     |
| PGID         | 应用运行时使用的组ID  | 1000     |

### 挂载说明

| 容器内目录 | 描述     |
|-------|--------|
| /app  | 用户配置目录 |

### 端口说明

| 容器内端口 | 描述    |
|-------|-------|
| 8080  | Web端口 |
| 5900  | Vnc端口 |



