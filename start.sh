#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD)

if [ x$1 != x ]; then
	para1=$1
else
	para1=""
fi

echo ": Start a great day!"
#1. switch to main
if [ "$branch" != "main" ]; then
	echo "> git switch main"
	git switch main
fi
#2. pull new files online
if [ "$para1" == "github" ]; then
	echo "> git pull $github main"
	while ! git pull $github main; do
		echo ": Pull $github failed, retrying in 5 seconds..."
		sleep 5
	done
elif [ "$para1" == "gitee" ]; then
	echo "> git pull $gitee main"
	while ! git pull $gitee main; do
		echo ": Pull $gitee failed, retrying in 5 seconds..."
		sleep 5
	done
else
	echo "> git pull $github main"
	while ! git pull $github main; do
		echo ": Pull $github failed, retrying in 5 seconds..."
		sleep 5
	done
	echo "> git pull $gitee main"
	while ! git pull $gitee main; do
		echo ": Pull $gitee failed, retrying in 5 seconds..."
		sleep 5
	done
fi
#3. switch to dev
if git rev-parse --quiet --verify dev; then
	echo "> git switch dev"
	git switch dev
else
	echo "> git switch -c dev"
	git switch -c dev
fi
#4. merge main
echo "> git merge main"
git merge main

echo ": Working enviroment is prepared"
