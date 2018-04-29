# skel
Skel is a quick and easy way to create a skeleton container directory with Dockerfile, .dockerignore + entrypoint.sh 

Provide your UID and GID and map a directory on the host to /skel to populate it. The Dockerfile will ensure wget is present and create a dockerfile which downloads dumb-init and calls it as the entrypoint, it'll also add a .dockerignore with .git prepopulated.

## Usage:

Create new files in ./myapp 

`docker run --rm -e PUID=$(id -u) -e PGID=$(id -g) -v $(pwd)/myapp:/skel udkyo/skel`

Or to overwrite existing files, add -f
 
`docker run --rm -e PUID=$(id -u) -e PGID=$(id -g) -v $(pwd)/myapp:/skel udkyo/skel -f`

Alpine is used unless an image environment variable is set, e.g.

`docker run --rm -e PUID=$(id -u) -e PGID=$(id -g) -v ${pwd}/myapp:/skel -e image=centos udkyo/skel -f`

The skeleton Dockerfile uses an env var for installing packages, in the resulting Dockerfile you can modify the line `ENV PACKAGES="wget"` to include any additional packages your image requires inside the quotes. Package installation is generalised to work with apk/apt/yum/pacman.
