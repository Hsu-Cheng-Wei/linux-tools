#!bin/bash

head=$(printf '\357\273\277')

for i in $(find $1 | sed -n '/.*\.cs$/p')
do
    for j in $(file -bi $i | awk '{FS=";"}{print $NF}')
    do
      if [ $j != "charset=utf-8" ]; 
      then
        file1=$(echo $i | awk -F/ '{print $3}')
        file2=$(echo $i | grep '.*\/obj\/.*')
	if [ $file1 != "workflow-engine" ] && [ ! $file2 ];
	then
		i_encoding=$(echo $j | awk -F= '{print $2}' | sed 's/\s//g')
		echo Change file $i from $i_encoding to utf-8
		if [ "$i_encoding" = "us-ascii" ];
		then
			sed -i "s/^/$head/" $i
		else
			enca -L zh_TW -x UTF-8 $i
		fi
	fi
      fi
    done
done
