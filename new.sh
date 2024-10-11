#!/bin/bash

# 更新软件
echo "正在更新系统..."
apt-get update && apt-get upgrade -y

# 安装 Docker
echo "正在安装 Docker..."
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce

# 启动 Docker 服务
systemctl start docker
systemctl enable docker

# 运行 Portainer
echo "正在运行 Portainer..."
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data outlovecn/portainer-cn:latest

echo "设置完成！"