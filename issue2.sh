#!/bin/bash 

longest=""
longestc=0
shortest=""
shortestc=0
lastc=0

path=$1

for i in `find ${path} -maxdepth 1 -type f | sed 's/^\.\///g'`; do
	count=$((`echo $i | wc -c`-1))
	if [ ${count} -gt ${longestc} ]; then
		longestc=$count	
		longest=$i	
	elif [ ${count} -lt ${shortestc} ]; then
		shortestc=$count
		shortest=$i
	elif [ ${shortestc} -eq 0 ]; then
		shortestc=$count
		shortest=$i
	fi
done

echo "Longest filename is $longest with $longestc characters"
echo "Shortest filename is $shortest with $shortestc characters"
#echo $filename | wc -c
