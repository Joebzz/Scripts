#!/bin/bash
while read -r line ; do
	for f in *"$line".ps ; do
		if [ -f $f ]; then
			echo "$line is present in  $f" > perms_present.txt
			sed -i "/${line}/d" perms_left.txt
			break;
		fi
	done
done < list_perms.txt
read -p "Press any key to continue..."