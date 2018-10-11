#!/usr/bin/env bash

#Variables
URL="https://git.kernel.org/torvalds/t/linux-4.19-rc6.tar.gz"
TARGZ=$(basename $URL)
DIR=`tar -tzf linux-4.19-rc6.tar.gz | head -1 | cut -f1 -d"/"`

download(){
    wget $URL
}

uncompress(){
    tar -xvzf "$TARGZ"
}

###Program Begins###

download

uncompress
