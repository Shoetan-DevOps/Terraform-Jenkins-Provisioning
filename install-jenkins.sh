#! /bin/bash
# Script to install Jenkins 
<<ml
     Hige level Steps
     1) install depedndencies - wget, java jdk, git
     2) import jenkins key & install jenkins repo
     3) install jenkins
     4)
ml

# errors & logs
sudo touch /home/ec2-user/errors.txt

# Step 0: Set Hostname
sudo hostnamectl set-hostname Jenkins

# Step 1: cd to /opt install dependencies wget & git
cd /opt
sudo yum install wget git -y

# Step 2: Install Java jdk
sudo wget sudo wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo yum install jdk-8u131-linux-x64.rpm -y

# Step 3: Import Jenkins key & Install jenkins repo in yum repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
if [$? != 0]
  then
  echo "error" > /home/ec2-user/errors.txt
fi
cd /etc/yum.repos.d/
sudo curl -O https://pkg.jenkins.io/redhat-stable/jenkins.repo 

# Step 4:  install Jenkins
sudo yum install -y jenkins --nobest

# Step 5: Start & enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

