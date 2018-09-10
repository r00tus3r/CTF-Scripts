#!/bin/bash

for i in `cat darkc0de.txt`; do
	hash=$(./md5 $i);
	if test $hash = "784549a593bc62bda679661db129fe74"; then
		echo $i;
	fi
done
