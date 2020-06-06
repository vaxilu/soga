详细教程：[进入](https://github.com/sprov065/soga/wiki)

# soga 后端
## v2ray
关键部分使用极其高效且轻量的CCCCCCC语言编写，优化 v2ray 内存占用，在同等用户数量和相同的 alterId 下（众所周知，alterId的大小很影响内存），相比原版 v2ray 预计可降低40-60%的内存占用！！！

## trojan
soga 同时还支持高效轻量级的 trojan 后端，任君选择

## 支持的前端
|前端              |v2ray              |trojan           |
|------------------|------------------|------------------|
|sspanel-uim	   |√                 |√                 |
|v2board	       |√                 |前端不支持         |
|WHCMS             |开发中             |计划中            |
|v2-ui             |计划中             |计划中            |


## 功能介绍
|功能              |v2ray              |trojan           |
|------------------|------------------|------------------|
|单端口多用户	   |√                 |√                 |
|用户流量统计	   |√                 |√                 |
|限速              |√                 |√                 |
|限连接数           |√                 |√                |
|服务器信息上报      |√                |√                 |
|在线人数上报        |√                |√                 |
|在线IP上报         |√                 |√                 |
|自动增删用户       |√                 |√                  |
|审计规则           |√                 |√                 |
|禁止封禁IP连接      |√                |√                 |
|中转规则           |√                 |√                 |
|自动申请tls证书     |开发中             |开发中            |
|自动续签tls证书     |开发中             |开发中            |

## v2ray 支持的协议
|协议              |支持情况           |
|----------------- |------------------|
|tcp               |√                 |
|tcp+tls	       |√                 |
|ws                |√                 |
|ws+tls            |√                 |
|cdn+ws            |√                 |
|cdn+ws+tls        |√                 |

## trojan 支持的协议
|协议              |支持情况           |
|----------------- |------------------|
|trojan协议         |√                 |


## 对接方式
|对接方式           |v2ray             |trojan           |
|------------------|------------------|------------------|
|webapi     	   |√                 |√                 |
|数据库   	       |开发中             |开发中            |
|docker webapi     |开发中             |开发中            |
|docker 数据库      |开发中             |开发中            |

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
        <th rowspan="2">sspanel-uim</th>
        <td>v2ray</td>
        <td>√</td>
        <td rowspan="3" colspan="2" align="center">开发中</td>
    </tr>
    <tr>
        <td>trojan</td>
        <td>√</td>
    </tr>
    <tr>
        <th>v2board</th>
        <td>v2ray</td>
        <td>√</td>
    </tr>
    <tr>
        <th rowspan="2">WHCMS</th>
        <td>v2ray</td>
        <td rowspan="2" colspan="3" align="center">开发中</td>
    </tr>
    <tr>
        <td>trojan</td>
    </tr>
    <tr>
        <th rowspan="2">v2-ui</th>
        <td>v2ray</td>
        <td rowspan="2">计划中</td>
        <td>×</td>
        <td rowspan="2">计划中</td>
    </tr>
    <tr>
        <td>trojan</td>
        <td>×</td>
    </tr>
</table>

加入我们：[Telegram群组](https://t.me/soga_v2ray)
