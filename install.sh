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
        yum install wget curl tar crontabs socat -y
    else
        apt install wget curl tar cron socat -y
    fi
}

# 0: running, 1: not running, 2: not installed
check_status() {
    if [[ ! -f /etc/systemd/system/soga.service ]]; then
        return 2
    fi
    temp=$(systemctl status soga | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
    if [[ x"${temp}" == x"running" ]]; then
        return 0
    else
        return 1
    fi
}

install_acme() {
    curl https://get.acme.sh | sh
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
        echo -e "全新安装，请先参看 wiki 教程：https://github.com/sprov065/soga/wiki，配置必要的内容"
    else
        systemctl start soga
        sleep 2
        check_status
        echo -e ""
        if [[ $? == 0 ]]; then
            echo -e "${green}soga 重启成功${plain}"
        else
            echo -e "${red}soga 可能启动失败，请稍后使用 soga log 查看日志信息，若无法启动，则可能更改了配置格式，请前往 wiki 查看：https://github.com/sprov065/soga/wiki${plain}"
        fi
    fi
    curl -o /usr/bin/soga -Ls https://raw.githubusercontent.com/sprov065/soga/master/soga.sh
    chmod +x /usr/bin/soga
    echo -e ""
    echo "soga 管理脚本使用方法: "
    echo "------------------------------------------"
    echo "soga              - 显示管理菜单 (功能更多)"
    echo "soga start        - 启动 soga"
    echo "soga stop         - 停止 soga"
    echo "soga restart      - 重启 soga"
    echo "soga status       - 查看 soga 状态"
    echo "soga enable       - 设置 soga 开机自启"
    echo "soga disable      - 取消 soga 开机自启"
    echo "soga log          - 查看 soga 日志"
    echo "soga update       - 更新 soga"
    echo "soga install      - 安装 soga"
    echo "soga uninstall    - 卸载 soga"
    echo "------------------------------------------"
}

echo -e "${green}开始安装${plain}"
install_base
install_acme
install_soga
