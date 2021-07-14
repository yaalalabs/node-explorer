#!/bin/bash

function message() {
  echo -e "\e[1;34m$1\e[0m"
}

message "Initializing Build.."

set -xe
base_tag=-"t yaalalabs/node-explorer"
use_docker=0

if [ ! -z $1 ]; then
    source_tag=$1
    shift
fi

while [ ! -z $1 ]; do
    if [ $1 == '--use-docker' ];then
        use_docker=1
    elif [ $1 == 'latest' ];then
        tags="$tags $base_tag"
    else
        tags="$tags $base_tag:$1"
    fi

    shift
done

if [ -z ${tags+x} ]; then
    tags=$base_tag
fi

if [ -z ${source_tag+x} ]; then
    DATE=`date '+%Y%m%d-%H%M'`
    source_tag=$DATE
fi

message "Source tag $source_tag"

message "Generating Corda Node Explorer.."
docker build --build-arg VERSION_TAG=$source_tag --force-rm --compress $tags .
message "Completed"
