#!/bin/bash
#--------------------------------------------
# adb wifi 启动关闭
# author: Suroy
# site：suroy.cn
# date: 2022.2.15
# slogan：学的不仅是技术，更是梦想！
#--------------------------------------------

# 初始化
mroot=true # 默认是否以root进行
mport=5555 # 默认adb端口号


# main
:<<!
主函数
useage: script start # 启动
!
function main(){
    echo "option: $1"
    echo "mode: $2"
    opt=$1

    # 判断root
    if [[ $1 == 'root' ]]
    then
        cmd=true
    fi
    

    # 逻辑处理
    if [[ ${opt} == 'start' ]]
    then
        echo 'Start'
        startAdb
    elif [[ ${opt} == 'stop' ]]
    then
        echo 'Stop'
        stopAdb
    else
        echo 'command not found'
    fi
}

# 启动ADB
function startAdb(){
    if [ ${mroot} ]
    then
        su -c "
        setprop service.adb.tcp.port ${opt}
        stop adbd # 重启adbd
        start adbd"
    else
        setprop service.adb.tcp.port ${mport}
        stop adbd # 重启adbd
        start adbd
    fi
}

# 关闭ADB
function stopAdb(){
    setprop service.adb.tcp.port -1
    stop adbd
    start adbd
}

# run
main $1 $2
