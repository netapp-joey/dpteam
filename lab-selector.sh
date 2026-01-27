#! /bin/sh
# Most code stolen from NAS. If it doesn't work, blame them.

while getopts p: flag
do
	case "${flag}" in
	p) playbook=${OPTARG};;
	esac
done

#install stuff if stuff isn't installed
if ! test -f "$HOME/ansiblelabfile_nodelete"
then
	echo "Running first-time Install"
 	sleep 2s
	#Upgrade pip
	python3 -m pip install --upgrade pip
	#Install ansible
	python3 -m pip install ansible
	#Install ontap collection
	ansible-galaxy collection install netapp.ontap

 	#Setup the clusters
    curl -L -o setupClusters.yml https://github.com/netapp-joey/dpteam/raw/main/setupClusters.yml
	ansible-playbook setupClusters.yml
 
	#Make the test file
	touch "$HOME/ansiblelabfile_nodelete"
 	echo "Install done, running lab"
  	sleep 2s
fi

#Get playbook
curl -L -o $playbook.yml https://github.com/netapp-joey/dpteam/raw/main/$playbook.yml

#play the playbook
ansible-playbook $playbook.yml

echo "############"
echo "Lab started!"
echo "############"
