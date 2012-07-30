#!/bin/bash

c=0

while read i; do
	c=$(($c+1))
done

echo $c
