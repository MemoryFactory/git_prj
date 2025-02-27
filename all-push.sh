#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD) 

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
