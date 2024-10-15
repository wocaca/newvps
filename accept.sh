#!/bin/bash

# 检查当前的 iptables 规则
echo "当前 iptables 规则："
sudo iptables -L -v -n

# 设置 INPUT 链的默认策略为 ACCEPT
echo "设置 INPUT 链的默认策略为 ACCEPT..."
sudo iptables -P INPUT ACCEPT

# 安装 iptables-persistent（如果尚未安装）
if ! dpkg -l | grep -q iptables-persistent; then
    echo "安装 iptables-persistent..."
    sudo apt-get update
    sudo apt-get install -y iptables-persistent
fi

# 保存当前规则
echo "保存当前 iptables 规则..."
sudo iptables-save | sudo tee /etc/iptables/rules.v4

# 启用 netfilter-persistent 服务
echo "启用 netfilter-persistent 服务..."
sudo systemctl enable netfilter-persistent

# 启动 netfilter-persistent 服务
echo "启动 netfilter-persistent 服务..."
sudo systemctl start netfilter-persistent

# 验证设置
echo "验证设置："
sudo iptables -L -v -n

echo "脚本执行完成！"
