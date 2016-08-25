#!/usr/bin/bash

# Extracts contents of a compressed tar archive.
# Counts the number of files that contain the word "SUCCESS"
# and the number containing the word "FAILURE."

tar_file=$1
temp_dir=`mktemp --directory`

tar zxf $tar_file --directory $temp_dir

num_successes=`grep -lr SUCCESS $temp_dir | wc -l`
num_failures=`grep -lr FAILURE $temp_dir | wc -l`

echo "There were $num_successes successes and $num_failures failures."

rm -rf $temp_dir
