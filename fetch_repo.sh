#!/bin/bash

# Fetch last modified repository from github

clear

API_URL="https://api.github.com/users/$1/repos?sort=updated&per_page=1"

API_QUERY=$(curl -s $API_URL)

RESPONSE_CODE=$(curl -s -o /dev/null -w '%{http_code}' $API_URL;)

if [ -z "$1" ]; 
then
	echo "Type repo name as parameter"
else
	if [[ $RESPONSE_CODE -eq 200 ]]; 
	then
		echo "Fetching data for $1"
		echo $API_QUERY | jq -c '.[] | .name'
	else
		echo "Repository not found :( Response code: $RESPONSE_CODE"
	fi
fi
