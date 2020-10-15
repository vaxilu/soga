详细教程：[进入](https://doc.sprov.xyz)

商业版价格：[进入](https://doc.sprov.xyz/future/get-license-code)

# soga 后端
soga 后端是一个同时支持 v2ray、Trojan、Shadowsocks 的后端，社区版最高支持88用户，优化了长时间运行的内存占用。

## v2ray
针对 VMess 占内存的特点通过数据结构特别优化了 VMess 协议的内存占用，在相同用户数量和 alterId 下，相对于原版 v2ray 来说可节省 60% 以上的内存空间

支持 VLESS 协议，VLESS 是 v2ray 新推出的协议，比 VMess 协议要轻量得多，完全解决了内存占用大的问题，无需同步时间，与 Trojan 一样轻量、快速，待客户端普及后，推荐从 VMess 转换到此协议上来。

支持 v2ray 最新 VMessAEAD 协议，开启后仍可同时兼容原 VMess 协议

**VLESS 协议还在完善中，目前仅供测试用途**

## Trojan
soga 同时实现了 Trojan 协议，并支持 UDP FullCone，Trojan 协议相对于 VMess 来说非常轻量和高效。

## Shadowsocks
支持单端口多用户、udp fullcone、防重放攻击

## 支持的前端
|前端              |v2ray              |trojan           |shadowsocks           |
|------------------|------------------|------------------|------------------|
|sspanel-uim	   |√                 |√                 |开发中                 |
|v2board	   |√                 |√                 |√                 |
|WHCMS             |√             |不支持            |不支持            |
|vnetpanel         |√                 |√                 |暂无计划                 |
|proxypanel         |开发中                 |开发中                 |开发中                 |


## 功能介绍
|功能              |v2ray              |trojan           |shadowsocks           |
|------------------|------------------|------------------|------------------|
|单端口多用户	   |√                 |√                 |√                 |
|用户流量统计	   |√                 |√                 |√                 |
|限速              |√                 |√                 |√                 |
|限连接数           |√                 |√                |√                 |
|服务器信息上报      |√                |√                 |√                 |
|在线人数上报        |√                |√                 |√                 |
|在线IP上报         |√                 |√                 |√                 |
|自动增删用户       |√                 |√                  |√                 |
|审计规则           |√                 |√                 |√                 |
|禁止封禁IP连接      |√                |√                 |√                 |
|自动申请tls证书     |√                 |√                 |√                 |
|自动续签tls证书     |√                 |√                 |√                 |
|dns流媒体解锁       |√                 |√                 |√                 |
|自动同步时间        |√                 |√                 |√                 |

## v2ray 支持的协议
|协议              |支持情况           |
|----------------- |------------------|
|VMess             |tcp,tcp+tls,ws,ws+tls                 |
|VLESS             |tcp,tcp+tls,ws,ws+tls                 |

## Trojan 支持的协议
|协议              |支持情况           |
|----------------- |------------------|
|Trojan协议         |√                 |

## Shadowsocks 协议
|协议              |支持情况           |
|----------------- |------------------|
|Shadowsocks协议   |√                 |


## 对接方式
|对接方式           |v2ray             |trojan           |shadowsocks           |
|------------------|------------------|------------------|------------------|
|webapi     	   |√                 |√                 |√                 |
|数据库   	        |√                 |√                 |√                 |
|docker webapi     |√                 |√                 |√                 |
|docker 数据库     |√                 |√                 |√                 |

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
        <th rowspan="3">sspanel-uim</th>
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
        <td>开发中</td>
        <td>开发中</td>
        <td>开发中</td>
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
        <th rowspan="3">vnetpanel</th>
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
        <td>ss</td>
        <td>暂无计划</td>
        <td>暂无计划</td>
        <td>暂无计划</td>
    </tr>
    <tr>
        <th rowspan="3">proxypanel</th>
        <td>v2ray</td>
        <td rowspan="3" colspan="3" align="center">开发中</td>
    </tr>
    <tr>
        <td>trojan</td>
    </tr>
    <tr>
        <td>ss</td>
    </tr>
</table>

加入我们：[Telegram群组](https://t.me/soga_v2ray)

加入我们：[Telegram通知频道](https://t.me/sogav2ray)
