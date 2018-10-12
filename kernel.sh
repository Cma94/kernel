#!/usr/bin/env bash

#Variables
URL=https://git.kernel.org/torvalds/t/linux-4.19-rc6.tar.gz
TARGZ=$(basename $URL) 
#DEPRECATED DIR=`tar -tzf linux-4.19-rc6.tar.gz | head -1 | cut -f1 -d"/"`
DIR=`echo "${TARGZ%.*.*}"`

download(){
    wget $URL
}

uncompress(){
    tar -xvzf "$TARGZ"
}

confirm() {
    # call with a promt
    read -r -p "${1:-Are you sure? [y/N]}" response
      case "$response" in
         [yY][eE][sS]|[yY])
            true
            ;;
         *)
            false
            ;;
      esac
}

check_availability(){

if [ -e $1 ]; then
    echo "$1 already exist"
else
    $2
fi
}

###Program Begins###

check_availability $TARGZ download

check_availability $DIR uncompress
