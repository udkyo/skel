#!/bin/sh

image=${image:-alpine}

if [ "$1" = "-f" ] || ([ ! -f '/skel/Dockerfile' ] && [ ! -f '/skel/entrypoint.sh' ] && [ ! -f '/skel/.dockerignore' ]);
then
    sed "s#__IMAGE__#${image}#" /skeleton/Dockerfile > /skel/Dockerfile
    cp /skeleton/entrypoint.sh /skel
    cp /skeleton/.dockerignore /skel
else
    echo "Files already present in target directory, use -f to force overwrite"
fi