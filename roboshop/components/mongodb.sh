#!/bin/bash

source components/common.sh

COMPONENT=mongodb

echo -n "Configuring the MongoDB repo:"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/mongo.repo
stat $? 

echo -n "Installing Monogdb:"
yum install -y mongodb-org 
stat $? 

ech
systemctl enable mongod >> /tmp/mongodb.log
systemctl start mongod