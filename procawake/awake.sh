#!/bin/bash
#--------------------------------------------
# 监听进程存活
# note: 进程关闭则启动对应程序 ｜ 本文件为监听crontab的demo
# author: Suroy
# site：suroy.cn
# date: 2022.9.22
# slogan：学的不仅是技术，更是梦想！
# tips: 在 vim 中文件格式转换 :set fileformat=unix
#--------------------------------------------
line=$(ps -aux | grep -c crond | grep -v "grep") 

# 匹配的行数
if [ $line -eq 1 ]
then        

	# 重启crontab服务
	crond
	echo cron is restart

else
	echo cron is running.... 
	# 向日志发送邮件，显示运行中。。。

fi
