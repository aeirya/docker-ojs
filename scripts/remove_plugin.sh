# $1: plugin relative path in plugins folder in docker (e.g. themes/mytheme)

if [ -z $1 ]; then
    echo error: provide args
    exit
fi


### FOUND IN env.sh
# set root directory
project_root_dir=$(pwd)

while [ ! -e "$project_root_dir/scripts/ojs_container_id.sh" ]; do
    project_root_dir=$project_root_dir/..
done

# ojs docker container id
container_id=$(. $project_root_dir/scripts/ojs_container_id.sh)
###

path="/var/www/html/plugins/$1"
docker exec -it $container_id rm -r $path
