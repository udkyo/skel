#!/bin/sh

[ -z "$PUID" ] || [ -z "$PGID" ] && \
  printf "Please provide PUID/PGID, e.g:\n" && \
  printf "    docker run --rm -e PUID=\$(id -u) -e PGID=\$(id -g) -v \$(pwd)/output:/skel udkyo/skel\n" && \
  exit 1

adduser -D user
groupmod -o -g "${PGID}" user >/dev/null 2>&1
usermod -o -u "${PUID}" user >/dev/null 2>&1


if [ "$1" = "-f" ] || ([ ! -f '/skel/Dockerfile' ] && [ ! -f '/skel/entrypoint.sh' ] && [ ! -f '/skel/.dockerignore' ]);
then
    chown user:user /skel
    su -c "sed \"s#__IMAGE__#${image:-alpine}#\" /skeleton/Dockerfile > /skel/Dockerfile" user
    su -c "cp /skeleton/entrypoint.sh /skel" user
    su -c "cp /skeleton/.dockerignore /skel" user
else
    echo "Files already present in target directory, use -f to force overwrite"
fi