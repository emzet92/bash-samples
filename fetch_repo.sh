#!/bin/bash

if [ -z "$1" ]; 
then
	echo "Type repo name as parameter"
else
	echo "Fetching data for $1"
	curl -s "https://api.github.com/users/$1/repos?sort=updated&per_page=1" | jq -c '.[] | .name'
fi
