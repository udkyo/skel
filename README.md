# skel
Skel is a quick and easy way to create a skeleton container directory with Dockerfile + entrypoint.sh 

Map a directory on the host to /skel to populate it. The Dockerfile will ensure wget is present and create a dockerfile which downloads dumb-init in the entrypoint.

## Usage:

Create new files in ./myapp 

`docker run --rm -v $(pwd)/myapp:/skel udkyo/skel`

Overwrite existing files 
 
`docker run --rm -v $(pwd)/myapp:/skel udkyo/skel -f`

Alpine is used unless an image environment variable is set, e.g.

`docker run --rm -v ${pwd}/myapp:/skel -e image=centos udkyo/skel -f`

The skeleton Dockerfile uses an env var for installing packages, after the files have been created you can modify the line `ENV PACKAGES="wget"` to include any additional packages your image requires inside the quotes. Package installation is generalised to work with apk/apt/yum/pacman.