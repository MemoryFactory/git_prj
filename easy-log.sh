#!/bin/bash
if [ x$1 != x ]; then
	para1=$1
else
	para1=""
fi

if [ "$para1" == "oneline" ]; then
	echo "> git log --pretty=oneline --abbrev-commit --graph"
	git log --pretty=oneline --abbrev-commit --graph
elif [ "$para1" == "pretty" ]; then
	echo "> git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
elif [ "$para1" == "-h" ]; then
	echo "Usage: easy-log.sh [option]"
	echo " To show git log in a pretty and simple way."
	echo " oneline:(default) --pretty=oneline  --abbrev-commit --graph"
	echo " pretty: --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	echo " -h: help message"
else
	echo "> git log --pretty=oneline --abbrev-commit --graph"
	git log --pretty=oneline --abbrev-commit --graph
fi
