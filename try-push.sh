#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD) 

if [ x$1 != x ]; then
	para1=$1
else
	para1=""
fi

echo ": Start pushing..."
if [ "$para1" == "all" ]; then
	echo "> git push $github $branch"
	while ! git push $github $branch; do
		echo ": Push $github failed, retrying in 5 seconds..."
		sleep 5
	done
	echo ": Push $github successful"
	echo "> git push $gitee $branch"
	while ! git push $gitee $branch; do
		echo ": Push $gitee failed, retrying in 5 seconds..."
		sleep 5
	done
	echo ": Push $gitee successful"
elif [ "$para1" == "$github" ]; then
	echo "> git push $github $branch"
	while ! git push $github $branch; do
		echo ": Push $github failed, retrying in 5 seconds..."
		sleep 5
	done
	echo ": Push $github successful"
elif [ "$para1" == "$gitee" ]; then
	echo "> git push $gitee $branch"
	while ! git push $gitee $branch; do
		echo ": Push $gitee failed, retrying in 5 seconds..."
		sleep 5
	done
	echo ": Push $gitee successful"
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
	echo "> git push"
	while ! git push; do
		echo ": Push failed, retrying in 5 seconds..."
		sleep 5
	done
fi
echo ": Mission accomplish"
