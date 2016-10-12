#!/bin/bash
if [ ! -d "$PWD/combos" ]; then
  echo "Creating Combos folder..."
  mkdir -p "$PWD/combos"
fi
while read line ; do
	for f in *"$line".ps ; do
		if [ -f $f ]; then
			echo "$line is present in  $f"	
			sed -i "/${line}/d" perms_left.txt
			cp $f combos/
			break;
		fi
	done
done < list_perms.txt
read -p "Press any key to continue..."