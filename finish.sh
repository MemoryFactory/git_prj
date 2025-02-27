#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD)

echo ": Do you commit all of your modifications (y/[n])?"
read -p "> " answer
if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
	echo ": OK"
else
	echo ": Exit"
	exit 0
fi

echo ": Finish all your job!" 
#1. switch to main
if [ "$branch" != "main" ]; then
	echo "> git switch main"
	git switch main
fi
#2. merge dev
if git rev-parse --quiet --verify dev; then
	echo "> git merge --no-ff dev"
	git merge --no-ff dev -m "merge branch 'dev'"
fi
#3. push new files online
echo "> git push $github main"
while ! git push $github main; do
	echo ": Push $github failed, retrying in 5 seconds..."
	sleep 5
done
echo "> git push $gitee main"
while ! git push $gitee main; do
	echo ": Push $gitee failed, retrying in 5 seconds..."
	sleep 5
done

echo ": Everything has been done"
