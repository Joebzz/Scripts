#!/bin/sh

echo Start of script

minimumsize=10000000
files=$(find C:/Vids/UNEDITED/ -type f -name '*.asf')
track='HRX'

for f in $files
do
	actualsize=$(wc -c <"$f")
	lastmod=$(date +%Y_%m_%d -r "$f")
	filename=$(basename "$f")
	newfilename=$track'_'$lastmod'_'$filename
	if [ $actualsize -ge $minimumsize ]; then
		echo "File is being moved and renamed"
		mv -v $f Correct/$newfilename	
	fi
done
echo Script is complete
read -n 1 -s