#!/bin/bash

container_id=$(docker ps | grep ojs_app | awk '{print $1}')
echo $container_id