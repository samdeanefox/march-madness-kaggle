#!/bin/bash
# @author : Varun Patel
whereAmI="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $whereAmI

DEPENDENCIES_FILE_PATH=$(echo $(pwd)/dependencies.txt)
# echo $DEPENDENCIES_FILE_PATH

cd ../src

while IFS='' read -r dependency || [[ -n "$dependency" ]] ; do
	# echo hi
	conda install  $dependency
done < $DEPENDENCIES_FILE_PATH
