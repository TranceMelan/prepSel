#!/usr/bin/bash
export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null

sleep 2

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Lab16Cores_')
ipaddress=$(curl -s ifconfig.me)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 2`
echo ""
echo "You will be using $used_num_of_cores cores"
echo ""

sleep 2

echo "Changing to home directory..."
cd

echo "Update the repository and any packages..."
apt update && apt upgrade -y

echo "Install prerequisite system packages..."
apt install wget curl unzip jq python3 python3-pip unzip nano net-tools build-essential cmake binutils python3-venv -y

# Set metadata for Google Chrome repository...
meta_data=$(curl 'https://googlechromelabs.github.io/chrome-for-testing/'\
'last-known-good-versions-with-downloads.json')


echo "Download the latest Chrome binary..."
wget $(echo "$meta_data" | jq -r '.channels.Stable.downloads.chrome[0].url')

echo "Install Chrome dependencies..."
apt install ca-certificates fonts-liberation \
    libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 \
    libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 \
    libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 \
    libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
    libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 \
    libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils -y


echo "Unzip the binary file..."
unzip chrome-linux64.zip


echo "Downloading latest Chromedriver..."
wget $(echo "$meta_data" | jq -r '.channels.Stable.downloads.chromedriver[0].url')

echo "Unzip the binary file and make it executable..."
unzip chromedriver-linux64.zip

echo "Install Selenium..."
python3 -m pip install selenium

echo "Removing archive files"
rm chrome-linux64.zip  chromedriver-linux64.zip

pip3 install selenium

wget https://raw.githubusercontent.com/lungilemlonyeni859/prepSel/main/workload.py

pwd

ls -la

python3 workload.py
