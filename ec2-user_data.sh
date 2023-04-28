#!/bin/bash
apt-get install go -y 
go build httpg.go
cp httpg /home/ubuntu
cp httpg.service /etc/systemd/system
systemctl daemon-reload && systemctl start httpg
