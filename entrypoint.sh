#!/bin/sh

image=${image:-alpine}

if [ "$1" = "-f" ] || ([ ! -f '/skel/Dockerfile' ] && [ ! -f '/skel/entrypoint.sh' ]);
then
    sed "s#__IMAGE__#${image}#" /skeleton/Dockerfile > /skel/Dockerfile
    cp /skeleton/entrypoint.sh /skel/entrypoint.sh
else
    echo "Files already present in target directory, use -f to force overwrite"
fi