#!/bin/bash
apt-get install go -y 
cd /ALB-app/
go build httpg.go
cp httpg /home/ubuntu
cp httpg.service /etc/systemd/system
systemctl daemon-reload && systemctl start httpg
