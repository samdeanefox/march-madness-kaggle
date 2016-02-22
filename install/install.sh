#!/bin/bash
# @author : Varun Patel
whereAmI="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $whereAmI

DEPENDENCIES_FILE_PATH=$(echo $(pwd)/dependencies.txt)
DATABASE_DIRECTORY_PATH=$whereAmI/../data/
DATABASE_FILE_NAME=database.sqlite

# create environment :
cd ../src
conda create -n march-madness-kaggle python
source activate march-madness-kaggle
while IFS='' read -r dependency || [[ -n "$dependency" ]] ; do
	conda install  $dependency
done < $DEPENDENCIES_FILE_PATH
cd $whereAmI

# database import :
