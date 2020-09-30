#!/usr/bin/env bash

# check for passed in file

# if no file get urls from alexa.com

# grab top urls from alexa.com


targets=($( curl -s https://www.alexa.com/topsites | grep -oP '(?<=\/siteinfo\/).*?(?=")'))
length=${#targets[@]}
for ((i = 0; i != length; i++)); do
   echo "target $i: '${targets[i]}'"
done
# grep for website
# cat alexa.txt | grep something like (?<=\/siteinfo\/).*?(?=")
# need to Write a bash script that takes a file of hostnames as input and resolves them to IP addresses using the 'host' or 'nslookup' commands
