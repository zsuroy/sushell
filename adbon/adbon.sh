#!/bin/bash
#--------------------------------------------
# adb wifi 启动关闭
# author: Suroy
# site：suroy.cn
# date: 2022.2.15
# slogan：学的不仅是技术，更是梦想！
#--------------------------------------------

# 初始化
mroot=false # 默认是否以root进行
mport=5555 # 默认adb端口号

# main
:<<!
主函数
useage: scriptName start 5555 listen root # 启动wifi adb 5555端口 监听ipv6 root模式
!
function main(){
    echo "option: $1"
    echo "port: $2"
    echo "listen: $3"
    echo "mode: $4"
    opt=$1
    mport=$2

    # 判断root
    if [[ $4 == 'root' ]]
    then
        cmd=true
    fi
    

    # 逻辑处理
    if [[ ${opt} == 'start' ]]
    then
        echo '<Start>'
        startAdb

        # 伴随转发端口监听
        if [[ $3 == 'listen' ]]
        then
            echo '<Listen ipv6>'
            listenPort
        fi
    elif [[ ${opt} == 'stop' ]]
    then
        echo '<Stop>'
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
        setprop service.adb.tcp.port ${mport}
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
    if [ ${mroot} ]
    then
        su -c "
        setprop service.adb.tcp.port -1
        stop adbd # 重启adbd
        start adbd"
    else
        setprop service.adb.tcp.port -1
        stop adbd
        start adbd
    fi
    # 关闭所有socat进程
    kill -9 $(pidof socat)
}

# 启动端口转发
function listenPort(){
    # 监听本地ipv6(5556)端口转发到本地IPV4启动的Wi-Fi adb端口
    socat -d -d TCP6-LISTEN:5556,reuseaddr,fork tcp4:127.0.0.1:${mport} &
}

# run
main $1 $2 $3 $4
