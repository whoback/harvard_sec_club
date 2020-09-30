#!/bin/bash
# saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail -o noclobber -o nounset

function get_top_50_websites {
    targets=($( curl -s https://www.alexa.com/topsites | grep -oP '(?<=\/siteinfo\/).*?(?=")'))
    length=${#targets[@]}
    for ((i = 0; i != length; i++)); do
        echo "$i: '${targets[i]}'"
        host ${targets[i]}
    done
}

USAGE="Usage: $0 -f FILE or -g to generate hostname info for top 50 websites"

if [ "$#" == "0" ]; then
	echo "$USAGE"
	exit 1
fi

while getopts ":f:" opt; do
  case ${opt} in
    f )
      tar=$OPTARG
      cat $tar | while read line; do host $line; done
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))

# grep for website
# cat alexa.txt | grep something like (?<=\/siteinfo\/).*?(?=")
# need to Write a bash script that takes a file of hostnames as input and resolves them to IP addresses using the 'host' or 'nslookup' commands
