#!/usr/bin/env sh 
set -e

usage="
Usage: test.sh [options]

Description
  Run tests in all subdirectories

"



# Absolute path:
# 
# Usage: abs=`get_abs_path ./deploy/static`
#		 echo $abs
# 
function get_abs_path {
   dir=$(cd `dirname $1` >/dev/null; pwd )
   echo $dir
}
#

# Get basename:
function get_base_name {
	n=$1
	n=$(basename "$n")
	echo "${n%.*}"
}

# Source directory
#
srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`
dstdir=`pwd`

bold=$(tput bold)
reset=$(tput sgr0)
function print_important_message {
	printf "${bold}$1${reset}. "
}

function ask_for_key {
	printf "Press [enter] to continue"
	read -s # suppress user input
	echo 
}



# dryrun
dry_run=false
run() {
  echo "$1"
  if [[ $dry_run == false ]] ; then
    eval "$1"
  fi
}


for f in ./base/*
do
  # is it a directory?
  if [ -d "$f" ]; then
    cd $f && make test && cd $dstdir
  fi
done






