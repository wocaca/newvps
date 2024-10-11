#!/bin/bash

# 更新软件

sudo iptables -F
echo "正在更新系统..."
apt-get update && apt-get upgrade -y

# 安装 Docker
echo "正在安装 Docker..."
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce=5:25.0.1-1~ubuntu.20.04~focal




# 启动 Docker 服务
systemctl restart docker
systemctl enable docker

# 运行 Portainer
echo "正在运行 Portainer..."
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data outlovecn/portainer-cn:latest


docker run -itd --net=host --restart=always \
--name baota1 cyberbolt/baota \
-port 58888 -username baotawocaca -password baota150123

docker run --restart=always  -d -p 51984:1984 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 1984 -k 111222 -m aes-256-cfb

docker run --restart=always --network host -d --name frps snowdreamtech/frps

docker run -itd --name=lookbusy --restart=always \
    -e TZ=Asia/Shanghai \
    -e CPU_UTIL=10-20 \
    -e CPU_CORE=1 \
    -e MEM_UTIL=15 \
    -e SPEEDTEST_INTERVAL=120 \
    fogforest/lookbusy





echo "设置完成！"



