# soga 后端
关键部分使用极其高效且轻量的CCCCCCC语言编写，优化 v2ray 内存占用，在同等用户数量和相同的 alterId 下（众所周知，alterId的大小很影响内存），相比原版 v2ray 预计可降低40-60%的内存占用！！！

soga不仅是v2ray后端，未来还可能是tttttttrojan后端，敬请期待！！！

## 支持的前端：
 - ss-panel-v3-mod_Uim
 - v2board（开发中，进度0.0000001%）
 - 其它前端待更新支持

## 支持的功能：
 - 单端口多用户
 - 用户流量统计
 - 节点限速、用户限速
 - 用户连接数限制
 - 服务器在线状态、负载、开机时间上报
 - 在线人数上报
 - 在线IP上报
 - 根据前端设定自动增加删除用户（不重启,现有用户不断线）
 - 根据审计规则禁止用户访问
 - 上报触发审计规则的用户
 - 禁止已封禁的IP连接
 - 中转规则
 - 自动申请 tls 证书（待更新支持，进度0.0000001%）

## 支持的协议：
 - v2ray vmess 协议
   - tcp
   - tcp+tls
   - ws
   - ws+tls
   - cdn+ws
   - cdn+ws+tls
 - trojan 协议（待更新支持）

## 对接方式：
 - 二进制 systemd 运行：
   - webapi 对接
   - 数据库对接（待更新完善）
 - docker 运行（待更新完善）
 
前往 WIKI：https://github.com/sprov065/soga/wiki

详情联系：https://t.me/sprov
