#!/bin/sh

set -eu

BRANCH=${1:-master}
git fetch origin $BRANCH
git switch $BRANCH
git pull origin $BRANCH

# app
cd webapp/golang
go build -o app app.go
cd -

sudo systemctl restart isu-go.service

echo "success!"
