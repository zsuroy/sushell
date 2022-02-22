#!/bin/bash
#--------------------------------------------
# 监听进程存活
# note: 进程关闭时自动重启，配合定时任务使用效果更佳
# author: Suroy
# site：suroy.cn
# date: 2022.2.22
# slogan：学的不仅是技术，更是梦想！
#--------------------------------------------

sleeptime=3 # 休眠时间(S)
loop=false # 是否开启循环

:<<!
主函数
param: $1 进程关键字
param: $2 进程执行文件路径
usage: scriptName chrome chrome_path # 监听chrome进程
!
function main()
{
  while true
  do
      procnum=` ps -ef|grep "$1"|grep -vE "grep|procawake"|wc -l ` # 排除grep和本程序查询的进程
      # 进程在线 | 通常 -eq 1 为防止异常容错调整为 -ne 0
      if [[ ${procnum} -ne 0 ]]; then
           echo "Awake" $1
           # 判断跳出循环配合定时任务
           if [ ${loop} == false ]; then
            echo 'Break'
            break
           fi
      else
           echo "Die to reboot" $1
           "$2"& # 后台运行
      fi
      sleep ${sleeptime}
  done
}

main $1 $2;