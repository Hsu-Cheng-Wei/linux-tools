#!bin/bash

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
		echo $i $j
	fi
      fi
    done
done
