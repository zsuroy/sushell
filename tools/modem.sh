#!/bin/sh
#--------------------------------------------
# 光猫自动配置IPV6防火墙
# note: 开机自动应用规则
# author: Suroy
# site：https://suroy.cn
# date: 2022.9.22
# slogan：学的不仅是技术，更是梦想！
# tips: 注意模式开放进/出所有端口
#--------------------------------------------

#Color selection
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'
#Checking internet connection
clear
wget -q --spider https://suroy.cn --no-check-certificate
if [ "$?" -eq 0 ]; then
        echo -e $okegreen [✔]::[Internet Connection]: CONNECTED!;
        sleep 1
else
        echo -e $red [×]::[Internet Connection]: OFFLINE!;
        echo -e $yellow   "Kindly connect With Internet or WIFI"
        sleep 2
exit
fi
##########
#### Script starts
clear
echo ""
echo ""
echo ""
echo ""
echo -e $cyan  "      ███████╗██╗   ██╗██████╗  ██████╗ ██╗   ██╗           "
echo -e $red  "      ██╔════╝██║   ██║██╔══██╗██╔═══██╗╚██╗ ██╔╝           "
echo -e $green  "      ███████╗██║   ██║██████╔╝██║   ██║ ╚████╔╝            "
echo -e $red  "      ╚════██║██║   ██║██╔══██╗██║   ██║  ╚██╔╝             "
echo -e $yellow  "      ███████║╚██████╔╝██║  ██║╚██████╔╝   ██║██╗           "
echo -e $cyan  "      ╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝╚═╝           "
echo -e $cyan  "                                                            "
echo -e $green  "  ██████╗ ██████╗  ██████╗      ██╗███████╗ ██████╗████████╗"
echo -e $cyan  "  ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝"
echo -e $BlueF  "  ██████╔╝██████╔╝██║   ██║     ██║█████╗  ██║        ██║   "
echo -e $green  "  ██╔═══╝ ██╔══██╗██║   ██║██   ██║██╔══╝  ██║        ██║   "
echo -e $cyan  "  ██║     ██║  ██║╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║   "
echo -e $BlueF  "  ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝   "
echo -e $cyan  "           "
echo -e $lightgreen  "                  ᐯ乇尺丂丨ㄖ几 1.0                                                     "
echo -e $lightgreen  "               Blog | https://suroy.cn      "
echo -e $cyan  "                "
echo -e $green  "             Codes: https://github.com/zsuroy"
echo ""
sleep 2.0
echo -e $yellow " 𝕴𝖓𝖘𝖙𝖆𝖑𝖑𝖎𝖓𝖌 𝕯𝖊𝖕𝖊𝖓𝖉𝖊𝖓𝖈𝖎𝖊𝖘......."
sleep 2.0
echo -e $cyan   " 𝕻𝖑𝖊𝖆𝖘𝖊 𝖜𝖆𝖎𝖙 𝖎𝖙 𝖜𝖎𝖑𝖑 𝖙𝖆𝖐𝖊 𝖘𝖔𝖒𝖊 𝖙𝖎𝖒𝖊..."
echo -e $red    " 𝖉𝖊𝖕𝖊𝖓𝖉𝖘 𝖔𝖓 𝖞𝖔𝖚𝖗 𝖎𝖓𝖙𝖊𝖗𝖓𝖊𝖙 𝖈𝖔𝖓𝖓𝖊𝖈𝖙𝖎𝖔𝖓.."
echo ""
echo -e $cyan   " 𝕴𝖓𝖘𝖙𝖆𝖑𝖑𝖎𝖓𝖌 𝖈𝖔𝖗𝖊 𝖋𝖎𝖑𝖊𝖘...."
cd /etc
echo "#!/bin/sh" > rc.local
echo "ip6tables -F" >> rc.local
echo "ip6tables -P INPUT ACCEPT" >> rc.local
echo "ip6tables -P FORWARD ACCEPT" >> rc.local
echo "ip6tables -P OUTPUT ACCEPT" >> rc.local
chmod 755 rc.local
sleep 2.0
echo -e $red    " IP6TABLES 𝒞𝑜𝓂𝓅𝒾𝓁𝑒𝒹 𝒮𝓊𝒸𝒸𝑒𝓈𝓈𝒻𝓊𝓁𝓁𝓎....      "
sleep 2.0
echo ""
echo -e $lightgreen " 刀のW 尺ひ刀 $red IP6TABLES $lightgreen ｲの 丂ｲﾑ尺ｲ んﾘり尺ﾑ  "
echo -e $lightgreen " 配置完成 $red 请重启 $lightgreen 光猫应用  "
