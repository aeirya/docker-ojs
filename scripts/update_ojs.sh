#!/bin/bash

path=/var/www/html

# set root directory
root=$(pwd)

while [ ! -e "$root/scripts/ojs_container_id.sh" ]; do
    root=$root/..
done

file1=classes/components/forms/publication/IssueEntryForm.php
file2=lib/pkp/classes/components/forms/publication/ContributorForm.php

container_id=$(. $root/scripts/ojs_container_id.sh)

for file in $file1 $file2; do
    echo "Processing file: $file"
    # submit
    docker cp $root/ojs/$file $container_id:$path/$file
done

