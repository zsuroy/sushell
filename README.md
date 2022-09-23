# sushell
some of tools with shell by myself

🌈 @[Suroy](https://suroy.cn)

## 新增ADB启动小工具(**adbon**)
> 在root下可以实现自动启动ADBwifi功能，实现远程ADB  
> 2022.2.15

## 新增进程监听程序
> 监听进程存活，异常关闭时自动重启  
> 2022.2.22


usage:

```shell
./sushell/procawake/procawake.sh chrome chrome_path # 监听chrome进程
```

## 新增监听任务单文件demo
> 以监听crontab  
> 2022.9.22  
> file: `/sushell/procawake/awake.sh `


```bash
# 打开vim编辑器
vim ~/.bashrc

# 设置每次登入ssh或telnet自动监测crontab是否正常运行，异常则重启crontab
~/sushell/procawake/awake.sh
```

注意事项：
使用时文件名不能以对应进程关键字出现，否则会产生误判

## 新增光猫自动配置IPV6防火墙规则

> 配置开机自动开放进出IPV6所有端口
> 2022.9.22
> file: `/sushell/tools/modem.sh`

测试设备：`中国移动 H2-2` / 几乎所有光猫均可使用

使用说明:
```shell
sh -c "$(curl -L https://raw.githubusercontent.com/zsuroy/sushell/main/tools/modem.sh -k)"


```
执行完毕记得重启光猫


## 新增关闭光猫IPV6防火墙一键脚本

> 编写缘由：光猫开机会自动恢复默认配置，开启网络防火墙，若不进一步破解无法保存配置  
> 使用说明：用NAS、或者服务器上定期执行本脚本可以实现关闭防火墙（一般来说建议设置每次光猫重启后运行）  
> 2022.9.23 

测试设备：光猫`中国移动H2-2` 脚本运行平台`Termux`

注：运行之后不需要重启光猫，重启后需要再次运行本脚本。

命令：

```shell
# 单次运行
bash -c "$(curl -L https://raw.githubusercontent.com/zsuroy/sushell/main/tools/mReIP6Wall.sh -k)"

# 或者
cd ~
git clone https://github.com/zsuroy/sushell
chmod 755 ~/sushell/tools/mReIP6Wall.sh

# 加入定时任务
crontab -e
# 追加-每天23:30执行
30 23 * * * ~/sushell/tools/mReIP6Wall.sh

```