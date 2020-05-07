#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

cur_dir=$(pwd)

# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1

# check os
if [[ -f /etc/redhat-release ]]; then
    release="centos"
elif cat /etc/issue | grep -Eqi "debian"; then
    release="debian"
elif cat /etc/issue | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
elif cat /proc/version | grep -Eqi "debian"; then
    release="debian"
elif cat /proc/version | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
else
    echo -e "${red}未检测到系统版本，请联系脚本作者！${plain}\n" && exit 1
fi

if [ $(getconf WORD_BIT) != '32' ] && [ $(getconf LONG_BIT) != '64' ] ; then
    echo "本软件不支持 32 位系统(x86)，请使用 64 位系统(x86_64)，如果检测有误，请联系作者"
    exit -1
fi

os_version=""

# os version
if [[ -f /etc/os-release ]]; then
    os_version=$(awk -F'[= ."]' '/VERSION_ID/{print $3}' /etc/os-release)
fi
if [[ -z "$os_version" && -f /etc/lsb-release ]]; then
    os_version=$(awk -F'[= ."]+' '/DISTRIB_RELEASE/{print $2}' /etc/lsb-release)
fi

if [[ x"${release}" == x"centos" ]]; then
    if [[ ${os_version} -le 6 ]]; then
        echo -e "${red}请使用 CentOS 7 或更高版本的系统！${plain}\n" && exit 1
    fi
elif [[ x"${release}" == x"ubuntu" ]]; then
    if [[ ${os_version} -lt 16 ]]; then
        echo -e "${red}请使用 Ubuntu 16 或更高版本的系统！${plain}\n" && exit 1
    fi
elif [[ x"${release}" == x"debian" ]]; then
    if [[ ${os_version} -lt 8 ]]; then
        echo -e "${red}请使用 Debian 8 或更高版本的系统！${plain}\n" && exit 1
    fi
fi

install_base() {
    if [[ x"${release}" == x"centos" ]]; then
        yum install wget curl tar -y
    else
        apt install wget curl tar -y
    fi
}

install_soga() {
    systemctl stop soga
    cd /usr/local/
    if [[ -e /usr/local/soga/ ]]; then
        rm /usr/local/soga/ -rf
    fi
    last_version=$(curl -Ls "https://api.github.com/repos/sprov065/soga/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    echo -e "检测到 soga 最新版本：${last_version}，开始安装"
    wget -N --no-check-certificate -O /usr/local/soga.tar.gz https://github.com/sprov065/soga/releases/download/${last_version}/soga-linux64.tar.gz
    if [[ $? -ne 0 ]]; then
        echo -e "${red}下载 soga 失败，请确保你的服务器能够下载 Github 的文件，如果多次安装失败，请参考手动安装教程${plain}"
        exit 1
    fi
    tar zxvf soga.tar.gz
    rm soga.tar.gz -f
    cd soga
    chmod +x soga
    chmod +x bin/v2ray
    chmod +x bin/v2ctl
    mkdir /etc/soga/ -p
    rm /etc/systemd/system/soga.service -f
    cp -f soga.service /etc/systemd/system/
    systemctl daemon-reload
    systemctl enable soga
    echo -e "${green}soga v${last_version}${plain} 安装完成，已设置开机自启"
    if [[ ! -f /etc/soga/soga.conf ]]; then
        cp soga.conf /etc/soga/
        echo -e ""
        echo -e "全新安装，请首先编辑 ${green}/etc/soga/soga.conf${plain} 配置文件，配置必要的参数，然后启动 soga 后端"
    else
        systemctl start soga
        echo -e ""
        echo -e "更新完毕，已重启 soga"
    fi
    echo -e ""
    echo -e "soga 后端管理命令："
    echo -e "systemctl start soga               启动 soga"
    echo -e "systemctl restart soga             重启 soga"
    echo -e "systemctl stop soga                停止 soga"
    echo -e "systemctl enbale soga              设置开机自启"
    echo -e "systemctl disable soga             取消开机自启"
    echo -e "systemctl status soga              查看 soga 运行状态"
    echo -e "systemctl status soga --no-pager   查看 soga 日志"
}

echo -e "${green}开始安装${plain}"
install_base
install_soga
