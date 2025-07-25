#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD)

if [ x$1 != x ]; then
	para1=$1
else
	para1=""
fi

echo -e "\e[32m: Start a great day!\e[0m"
#1. switch to main
if [ "$branch" != "main" ]; then
	echo -e "\e[34m> git switch main\e[0m"
	git switch main
fi
#2. pull new files online
if [ "$para1" == "github" ]; then
	echo -e "\e[34m> git pull $github main\e[0m"
	while ! git pull $github main; do
		echo -e "\e[31m: Pull $github failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
elif [ "$para1" == "gitee" ]; then
	echo -e "\e[34m> git pull $gitee main\e[0m"
	while ! git pull $gitee main; do
		echo -e "\e[31m: Pull $gitee failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
else
	echo -e "\e[34m> git pull $github main\e[0m"
	while ! git pull $github main; do
		echo -e "\e[31m: Pull $github failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[34m> git pull $gitee main\e[0m"
	while ! git pull $gitee main; do
		echo -e "\e[31m: Pull $gitee failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
fi
#3. switch to dev
if git rev-parse --quiet --verify dev; then
	echo -e "\e[34m> git switch dev\e[0m"
	git switch dev
else
	echo -e "\e[34m> git switch -c dev\e[0m"
	git switch -c dev
fi
#4. merge main
echo -e "\e[34m> git merge main\e[0m"
git merge main

echo -e "\e[32m: Working enviroment is prepared\e[0m"
