#!/bin/bash

### Script used to deploy plugins directly on the ojs docker 

###
### NOTE: run this script from root of project (or a folder inside project)
###

# folder to submit
dir=$1

## FOUND IN env.sh
# set root directory
project_root_dir=$(pwd)

while [ ! -e "$project_root_dir/scripts/ojs_container_id.sh" ]; do
    project_root_dir=$project_root_dir/..
done

# ojs docker container id
container_id=$(. $project_root_dir/scripts/ojs_container_id.sh)
##

# find plugin info
plugin_name=$(basename $dir)
# plugin type
version_file=$dir/version.xml
plugin_type=$(cat $version_file | grep "<type>" | grep -o 'plugins.[^<]*' | sed 's/plugins.\(.*\)/\1/')


# path in docker
path=/var/www/html/plugins/$plugin_type/$plugin_name

# remove existing folder
docker exec -it $container_id rm -r $path

# submit
docker cp $dir $container_id:$path
