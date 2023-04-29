#!/bin/bash
apt-get update -y && apt-get install golang -y 
go build httpg.go
mkdir /etc/httpg
cp httpg /etc/httpg/
cp -r application /etc/httpg/
cp httpg.service /etc/systemd/system
systemctl daemon-reload && systemctl enable httpg && systemctl start httpg
