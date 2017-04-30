#!/bin/bash

echo -n "Enter a directory: "
read dir

num_files=$(find "${dir}" -maxdepth 1 -type f | wc -l)
num_dirs=$(find "${dir}" -maxdepth 1 -type d | wc -l)

echo "Number of files in ${dir} is: ${num_files}."
echo "Number of directories in ${dir} is: ${num_dirs}."

