#!/bin/bash

function linija(){
	echo ####################################################
	echo ""
}

echo "Instaliram osnomve alate"
linija

ssh deploy@192.168.0.10 -C "sudo apt-get update -y && sudo apt-get install ansible -y"

echo "pripremam ubuntu base tar.gz"
tar zcvf ubuntu_base.tar.gz ubuntu_base/
ssh deploy@192.168.0.10 -C "rm ubuntu_base.tar.gz"

echo "kopiram ubuntu base an sever"
scp ubuntu_base.tar.gz deploy@192.168.0.10:/home/deploy

echo "raspakujem i izvrsavam ansible"
ssh deploy@192.168.0.10 -C "tar xvf ubuntu_base.tar.gz"
ssh deploy@192.168.0.10 -C "ansible-playbook ubuntu_base/main.yml"


