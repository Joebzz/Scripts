#!/bin/sh

echo Start of script

minimumsize=10000000
files=$(find C:/Vids/UNEDITED/ -type f -name '*.asf')

for f in $files
do
	actualsize=$(wc -c <"$f")
	dateforsql=$(date +%Y-%m-%d -r "$f")
	if [ $actualsize -ge $minimumsize ]; then
		if ! grep -q $dateforsql DatesFile.txt; then
			echo $dateforsql >> DatesFile.txt
		fi
	fi
done
echo Script is complete
read -n 1 -s