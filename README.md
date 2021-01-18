详细教程：[进入](https://soga.vaxilu.com)

商业版价格：[进入](https://soga.vaxilu.com/future/get-license-code)

# soga 后端
soga 后端是一个同时支持 v2ray、Trojan、Shadowsocks、ShadowsocksR 的后端，社区版最高支持88用户，优化了长时间运行的内存占用。

## v2ray
针对 VMess 占内存的特点通过数据结构特别优化了 VMess 协议的内存占用，在相同用户数量和 alterId 下，相对于原版 v2ray 来说可节省 60% 以上的内存空间

支持 VLESS 协议，VLESS 是 v2ray 新推出的协议，比 VMess 协议要轻量得多，完全解决了内存占用大的问题，无需同步时间，与 Trojan 一样轻量、快速，待客户端普及后，推荐从 VMess 转换到此协议上来。

支持 v2ray 最新 VMessAEAD 协议，开启后仍可同时兼容原 VMess 协议

**VLESS 协议还在完善中，目前仅供测试用途**

## Trojan
soga 同时实现了 Trojan 协议，并支持 UDP FullCone，Trojan 协议相对于 VMess 来说非常轻量和高效。

## Shadowsocks
支持单端口多用户、udp fullcone、防重放攻击

## ShadowsocksR
支持单端口多用户、udp fullcone、防重放攻击

## 支持的前端
|前端              |v2ray              |trojan           |shadowsocks           |shadowsocksR           |
|------------------|------------------|------------------|------------------|------------------|
|sspanel-uim	   |√                 |√                 |√                 |√                 |
|v2board	   |√                 |√                 |√                 |不支持                 |
|WHCMS             |√             |计划中            |计划中            |不支持                 |
|vnetpanel         |√                 |√                 |暂无计划                 |暂无计划                 |
|proxypanel         |√                 |√                 |√                 |√                 |


## 功能介绍
|功能              |v2ray              |trojan           |shadowsocks           |shadowsocksR           |
|------------------|------------------|------------------|------------------|------------------|
|单端口多用户	   |√                 |√                 |√                 |√                 |
|多端口多用户	   |无面板支持                 |无面板支持                 |√                 |√                 |
|用户流量统计	   |√                 |√                 |√                 |√                 |
|限速              |√                 |√                 |√                 |√                 |
|全局限IP数           |√                 |√                |√                 |√                 |
|全局限设备数      |协议不支持          |协议不支持        |协议不支持          |√                 |
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
|aes-256-cfb   |auth_chain_a(开发中)       |tls1.2_ticket_auth|
|aes-128-ctr   |           |simple_obfs_http                          |
|aes-192-ctr   |                 |    |
|aes-256-ctr   |                 |    |
|aes-128-ofb   |                 |    |
|aes-192-ofb   |                 |    |
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
        <td>不支持</td>
        <td>√</td>
    </tr>
    <tr>
        <th rowspan="1">WHCMS</th>
        <td>v2ray</td>
        <td>×</td>
        <td>√</td>
        <td>√</td>
    </tr>
    <tr>
        <th rowspan="2">vnetpanel</th>
        <td>v2ray</td>
        <td>√</td>
        <td rowspan="2" align="center">暂无计划</td>
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
        <td rowspan="4" align="center">暂无计划</td>
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
