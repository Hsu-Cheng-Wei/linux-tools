#! /bin/bash

#------------------------
# file content:
# CH1
# --------------HELLO
# --------------HAY
# --------------Jowel
# CH2
# --------------JJ
# --------------John
# --------------keyborad
# CH3
# --------------BB
# --------------Tree
# --------------HELLO
# --------------BUS
#------------file content end-------------
#
# Target:
# 	Search content tile
# Example
#	Search HELLO
#	ouput CH1, CH3
#
#-----------------------

filename=$1
src=$2
dest=$3

for i in $(tac $1 | sed -n "/$src/=");
do
	tac $1 | sed -n "$i,$ p" | grep "$dest" | head -n 1
done

