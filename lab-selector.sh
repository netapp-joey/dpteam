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
	#Upgrade pip
	python3 -m pip install --upgrade pip
	#Install ansible
	python3 -m pip install ansible
	#Install ontap collection
	ansible-galaxy collection install netapp.ontap
	#Install requests.
	python3 -m pip install requests

	#Make the test file
	touch "$HOME/ansiblelabfile_nodelete"
fi

#Get playbook
#TO-DO: fix url
curl -L -o $playbook.yml <github_url goes here>/$playbook.yml

#play the playbook
ansible-playbook $playbook.yml
