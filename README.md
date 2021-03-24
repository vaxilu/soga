详细教程：[进入](https://soga.vaxilu.com)

商业版价格：[进入](https://soga.vaxilu.com/future/get-license-code)

# soga 后端
soga 后端使用 Go 语言全新实现 v2ray、Trojan、Shadowsocks、ShadowsocksR 等协议，不基于任何软件，专为面板对接打造，长期运行下内存占用低且非常稳定。

## v2ray
针对 VMess 占内存的特点通过数据结构特别优化了 VMess 协议的内存占用，在相同用户数量和 alterId 下，相对于原版 v2ray 来说可节省 **60%** 以上的内存空间

支持 VLESS 协议，VLESS 是 v2ray 新推出的协议，比 VMess 协议要轻量得多，完全解决了内存占用大的问题，无需同步时间，与 Trojan 一样轻量、快速。

支持 v2ray 最新 VMessAEAD 协议，开启后仍可同时兼容原 VMess 协议

**VLESS 协议还在完善中，目前仅供测试用途**

## Trojan
支持 UDP FullCone，Trojan 协议相对于 VMess 来说非常轻量和高效。

## Shadowsocks
密码式单端口多用户(v2board)、UDP FullCone、防重放攻击、针对密码式单端口特点进行性能优化。

## ShadowsocksR
混淆式单端口多用户、协议式单端口多用户、多端口多用户、UDP FullCone、防重放攻击，相对于 py 版的 ssr 后端，使用 Go 语言实现，性能极好，支持多核多线程，内存占用非常低，没有 py 版 ssr 后端的诸多通病。

## 支持的前端

> sspanel 只需使用 ssr 授权即可使用混淆和协议单端口，以及多端口，支持 ss AEAD 加密

|前端              |v2ray              |trojan           |shadowsocks           |shadowsocksR           |
|------------------|------------------|------------------|------------------|------------------|
|sspanel-uim	   |√                 |√                 |√(混淆单端、多端口)                 |√(协议单端、多端口)                 |
|v2board	   |√                 |√                 |√(密码单端)                 |×                 |
|WHCMS             |√(V2raySocks)             |×            |√(V2raySocks)            |√(LegendSock)                 |
|vnetpanel         |√                 |√                 |×                 |×                 |
|proxypanel         |√                 |√                 |√                 |√                 |


## 功能介绍
|功能              |v2ray              |trojan           |shadowsocks           |shadowsocksR           |
|------------------|------------------|------------------|------------------|------------------|
|单端口多用户	   |√                 |√                 |√                 |√                 |
|多端口多用户	   |×                 |×                 |√                 |√                 |
|用户流量统计	   |√                 |√                 |√                 |√                 |
|限速              |√                 |√                 |√                 |√                 |
|全局限IP数           |√                 |√                |√                 |√                 |
|全局限设备数      |×          |×        |×          |√                 |
|服务器信息上报      |√                |√                 |√                 |√                 |
|在线人数上报        |√                |√                 |√                 |√                 |
|在线IP上报         |√                 |√                 |√                 |√                 |
|自动增删用户       |√                 |√                  |√                 |√                 |
|审计规则           |√                 |√                 |√                 |√                 |
|禁止封禁IP连接      |√                |√                 |√                 |√                 |
|自动申请tls证书     |√                 |√                 |√                 |√                 |
|自动续签tls证书     |√                 |√                 |√                 |√                 |
|dns流媒体解锁       |√                 |√                 |√                 |√                 |
|自动同步时间        |√                 |√                 |√                 |√                 |

## v2ray 支持的协议
|协议              |支持情况           |
|----------------- |------------------|
|VMess             |tcp, tcp+tls, ws, ws+tls, h2c, h2+tls                 |
|VMessAEAD             |tcp, tcp+tls, ws, ws+tls, h2c, h2+tls              |
|VLESS             |tcp, tcp+tls, ws, ws+tls, h2c, h2+tls                 |

## Trojan 支持的协议
|协议              |支持情况           |
|----------------- |------------------|
|Trojan协议         |√                 |

## Shadowsocks

> 对接 V2board 面板支持以下加密

|加密              |
|----------------- |
|aes-128-gcm   |
|aes-192-gcm   |
|aes-256-gcm   |
|chacha20-ietf-poly1305|

## ShadowsocksR

> 对接 SSPanel 与 ProxyPanel 支持以下加密、协议、混淆，可兼容 ss

|加密              |协议           |混淆           |
|----------------- |------------------|------------------|
|none   |origin                 |plain|
|aes-128-cfb   |auth_aes128_md5                 |http_simple|
|aes-192-cfb   |auth_aes128_sha1        |http_post|
|aes-256-cfb   |auth_chain_a       |tls1.2_ticket_auth|
|aes-128-ctr   |auth_chain_b           |simple_obfs_http                          |
|aes-192-ctr   |auth_chain_c                 |simple_obfs_tls    |
|aes-256-ctr   |auth_chain_d                 |    |
|aes-128-ofb   |auth_chain_e                 |    |
|aes-192-ofb   |auth_chain_f                 |    |
|aes-256-ofb   |                 |    |
|chacha20      |                 |    |
|chacha20-ietf |                 |    |
|salsa20       |                 |    |
|aes-128-gcm   |                 |    |
|aes-192-gcm   |                 |    |
|aes-256-gcm   |                 |    |
|chacha20-ietf-poly1305|                 |    |


## 对接方式
|对接方式           |v2ray             |trojan           |shadowsocks           |shadowsocksR           |
|------------------|------------------|------------------|------------------|------------------|
|webapi     	   |√                 |√                 |√                 |√                 |
|数据库   	        |√                 |√                 |√                 |√                 |
|docker webapi     |√                 |√                 |√                 |√                 |
|docker 数据库     |√                 |√                 |√                 |√                 |

## 前端对接方式对照表
<table>
    <tr>
        <th>前端</th>
        <th>后端</th>
        <th>webapi</th>
        <th>数据库</th>
        <th>docker</th>
    </tr>
    <tr>
        <th rowspan="4">sspanel-uim</th>
        <td>v2ray</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <td>trojan</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <td>ss</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <td>ssr</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <th rowspan="3">v2board</th>
        <td>v2ray</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <td>trojan</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <td>ss</td>
        <td>√</td>
        <td>×</td>
        <td>√</td>
    </tr>
    <tr>
        <th rowspan="3">WHCMS</th>
        <td>v2ray</td>
        <td>×</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <td>ssr</td>
        <td>×</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <td>ss</td>
        <td>×</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <th rowspan="2">vnetpanel</th>
        <td>v2ray</td>
        <td>√</td>
        <td rowspan="2" align="center">×</td>
        <td>√</td>
    </tr>
    <tr>
        <td>trojan</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <th rowspan="4">proxypanel</th>
        <td>v2ray</td>
        <td>√</td>
        <td rowspan="4" align="center">×</td>
        <td>√</td>
    </tr>
    <tr>
        <td>trojan</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <td>ss</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <td>ssr</td>
        <td>√</td>
        <td>√</td>
    </tr>
</table>

加入我们：[Telegram群组](https://t.me/soga_v2ray)

加入我们：[Telegram通知频道](https://t.me/sogav2ray)
