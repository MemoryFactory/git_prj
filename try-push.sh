#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD) 

if [ x$1 != x ]; then
	para1=$1
else
	para1=""
fi

echo -e "\e[32m: Start pushing...\e[0m"
if [ "$para1" == "all" ]; then
	echo -e "\e[34m> git push $github $branch\e[0m"
	while ! git push $github $branch; do
		echo -e "\e[31m: Push $github failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[32m: Push $github successful\e[0m"
	echo -e "\e[34m> git push $gitee $branch\e[0m"
	while ! git push $gitee $branch; do
		echo -e "\e[31m: Push $gitee failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[32m: Push $gitee successful\e[0m"
elif [ "$para1" == "$github" ]; then
	echo -e "\e[34m> git push $github $branch\e[0m"
	while ! git push $github $branch; do
		echo -e "\e[31m: Push $github failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[32m: Push $github successful\e[0m"
elif [ "$para1" == "$gitee" ]; then
	echo -e "\e[34m> git push $gitee $branch\e[0m"
	while ! git push $gitee $branch; do
		echo -e "\e[31m: Push $gitee failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
	echo -e "\e[32m: Push $gitee successful\e[0m"
elif [ "$para1" == "-h" ]; then
	echo "Usage: try-push.sh [REMOTE]"
	echo ""
	echo "Without REMOTE, try pushing origin only"
	echo " REMOTE:"
	echo "  all: push github first, and then gitee"
	echo "  github: push github only"
	echo "  gitee: push gitee only"
	echo "  -h: help message"
else
	echo -e "\e[34m> git push\e[0m"
	while ! git push; do
		echo -e "\e[31m: Push failed, retrying in 5 seconds...\e[0m"
		sleep 5
	done
fi
echo -e "\e[32m: Mission accomplish\e[0m"
