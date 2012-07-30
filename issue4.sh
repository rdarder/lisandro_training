#!/bin/bash -x

function maxpath {
	path=$1
	#pwd=`pwd`

	#path=`echo ${path} | sed -r 's!(^[^/].*$)!${pwd}/\1/g'`

	if [ -e "${path}" ]; then
		echo ${path}
		exit
	else 
		subpath=`echo ${path} | sed -r 's!^(.*)\/[^/]*$!\1!g'`
		echo ${subpath}
		maxpath ${subpath}
	fi	
}

maxpath $1
