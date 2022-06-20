#!/bin/bash

    #Authors: Lynn, Arthur, Nora, Rebecca, Nadine
    #Date: 13-June-2022

## Writing a script to automate Jenkins Configuration


#Installation of java 1.8
echo "Installing Java-1.8.0"
yum install java-1.8.0-openjdk-devel -y

#enable jenkins
echo "Enable Jenkins!!!!"
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

#installation of wget
ls -l /usr/bin | grep -q wget
if 
    [ $? -eq 0]

then 
    echo "You already have wget.."

else 
    echo "installing wget"
    yum install wget -y
fi

#Now, disable key check on the repo
echo "Enabling..."
sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

#installation of jenkins
echo "installing jenkins!!"
yum install jenkins -y

#starting jenkins service
systemctl start jenkins
sleep 2

#checking the jenkins status
systemctl status jenkins
sleep 2

#enabeling jenkins
systemctl enable jenkins
sleep 5

echo "Adjusting the firewall"
firewall-cmd --permanent --zone=public --add-port=8080/tcp  
firewall-cmd --reload

sleep 3
ifconfig

