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

USAGE="Usage: $0 [-f <FILE>] [-g]

  -f,           output hostname information from file
  -g,           will generate hostname information from alexa.com top 50 list"

if [ "$#" == "0" ]; then
	echo "$USAGE"
	exit 1
fi

while getopts ":f:g" opt; do
  case ${opt} in
    g )
      get_top_50_websites
      ;;
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
