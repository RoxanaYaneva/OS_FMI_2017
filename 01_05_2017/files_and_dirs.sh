#!/bin/bash

read -p "Enter a directory: " DIR

NUM_FILES=$(find "${DIR}" -maxdepth 1 -type f | wc -l)
NUM_DIRS=$(find "${DIR}" -maxdepth 1 -type d | wc -l)

echo "Number of files in ${DIR} is: ${NUM_FILES}."
echo "Number of directories in ${DIR} is: ${NUM_DIRS}."

