#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD) 

if [ x$1 != x ]; then
	para1=$1
else
	para1=""
fi

echo -e "\e[32m: Start pulling...\e[0m"
if [ "$para1" == "all" ]; then
	echo -e "\e[34m> git pull $github $branch\e[0m"
	while ! git pull $github $branch; do
		echo -e "\e[31m: Pull $github failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[32m: Pull $github successful\e[0m"
	echo -e "\e[34m> git pull $gitee $branch\e[0m"
	while ! git pull $gitee $branch; do
		echo -e "\e[31m: Pull $gitee failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[32m: Pull $gitee successful\e[0m"
elif [ "$para1" == "$github" ]; then
	echo -e "\e[34m> git pull $github $branch\e[0m"
	while ! git pull $github $branch; do
		echo -e "\e[31m: Pull $github failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[32m: Pull $github successful\e[0m"
elif [ "$para1" == "$gitee" ]; then
	echo -e "\e[34m> git pull $gitee $branch\e[0m"
	while ! git pull $gitee $branch; do
		echo -e "\e[31m: Pull $gitee failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[32m: Pull $gitee successful\e[0m"
elif [ "$para1" == "-h" ]; then
	echo "Usage: try-pull.sh [REMOTE]"
	echo ""
	echo "Without REMOTE, try pulling origin only"
	echo " REMOTE:"
	echo "  all: pull github first, and then gitee"
	echo "  github: pull github only"
	echo "  gitee: pull gitee only"
	echo "  -h: help message"
else
	echo -e "\e[34m> git pull\e[0m"
	while ! git pull; do
		echo -e "\e[31m: Pull failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
fi
echo -e "\e[32m: Mission accomplish\e[0m"
