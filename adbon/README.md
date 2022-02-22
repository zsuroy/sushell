# ☄️ 概述  
一个快捷启动 wifi ADB 功能的shell脚本，目前可以实现启动/关闭ADB功能，监听IPV6转发（解决Android7.0以下不支持通过ipv6连接wifi adb功能）

> 🍄 [@Suroy](https://suroy.cn)  

----


# 🍁 使用说明
启动： `./adbon start 5555 listen root`  
> 启动端口号为5555的 WIFI ADB 服务，同时监听ipv6端口转发  
关闭： `./addon stop 5555 0 root`

# V1.2 2022.2.15  
1. 新增定义端口功能
2. 新增ipv6监听功能

