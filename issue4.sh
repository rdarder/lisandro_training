#!/bin/bash

function maxpath {
	path=$1
	cwd=`pwd`

	path=`echo ${path} | sed -r "s!(^[^/].*)!${cwd}/\1!g"`

	if [ -e "${path}" ]; then
		echo ${path}
		exit
	else 
		subpath=`echo ${path} | sed -r 's!^(.*)\/[^/]*$!\1!g'`
		maxpath ${subpath}
	fi	
}

maxpath $1
