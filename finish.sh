#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD)

#echo ": Do you commit all of your modifications (y/[n])?"
#read -p "> " answer
#if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
#	echo ": OK"
#else
#	echo ": Exit"
#	exit 0
#fi

if [[ $(git status --porcelain) ]]; then
	echo -e "\e[93mWarning: There are uncommitted files!\e[0m"
	git status --short
	echo ": Commit everything before finishing your work"
	echo -e "\e[5m>>>\e[0m \e[1;91mSTOP\e[0m \e[5m<<<\e[0m"
	exit 0
else
	echo "> "
fi

if [ x$1 != x ]; then
	para1=$1
else
	para1=""
fi

echo -e "\e[32m: Finish all your job!\e[0m" 
#1. switch to main
if [ "$branch" != "main" ]; then
	echo -e "\e[34m> git switch main\e[0m"
	git switch main
fi
#2. merge dev
if git rev-parse --quiet --verify dev; then
	echo -e "\e[34m> git merge --no-ff dev\e[0m"
	git merge --no-ff dev -m "Merge branch 'dev'"
fi
#3. push new files online
if [ "$para1" == "github" ]; then
	echo -e "\e[34m> git push $github main\e[0m"
	while ! git push $github main; do
		echo -e "\e[31m: Push $github failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
elif [ "$para1" == "gitee" ]; then
	echo -e "\e[34m> git push $gitee main\e[0m"
	while ! git push $gitee main; do
		echo -e "\e[31m: Push $gitee failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
else
	echo -e "\e[34m> git push $github main\e[0m"
	while ! git push $github main; do
		echo -e "\e[31m: Push $github failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[34m> git push $gitee main\e[0m"
	while ! git push $gitee main; do
		echo -e "\e[31m: Push $gitee failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
fi

echo -e "\e[32m: Everything has been done\e[0m"
