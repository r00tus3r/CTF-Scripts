#!/bin/bash

for i in `cat darkc0de.txt`; do
	hash=$(./md5 $i);
	if test $hash = "b00bc07db51868c46800ea3c5015e0be"; then
		echo $i;
	fi
done
