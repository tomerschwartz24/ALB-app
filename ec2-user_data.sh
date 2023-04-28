#!/bin/bash
apt-get update && apt-get install golang
go build httpg.go
cp httpg /home/ubuntu
cp -r application /home/ubuntu
cp httpg.service /etc/systemd/system

systemctl daemon-reload && systemctl start httpg
