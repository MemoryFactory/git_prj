#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD)

echo ": Start a great day!"
#1. switch to main
if [ "$branch" != "main" ]; then
	git switch main
fi
#2. pull new files online
while ! git pull $github main; do
	echo ": Pull $github failed, retrying in 5 seconds..."
	sleep 5
done
while ! git pull $gitee main; do
	echo ": Pull $gitee failed, retrying in 5 seconds..."
	sleep 5
done
#3. switch to dev
if git rev-parse --quiet --verify dev; then
	git switch dev
else
	git switch -c dev
fi
#4. merge main
git merge main

echo ": Working enviroment is prepared"
