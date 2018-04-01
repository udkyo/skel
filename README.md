# skel
Run skel to create a skeleton container directory and files. 

Map a directory on the host to /skel to quickly populate it with a Dockerfile and entrypoint script. The Dockerfile will ensure wget is present, and download dumb-init.

## Usage:

Create new files in ./myapp 

`docker run --rm -v $(pwd)/myapp:/skel udkyo/skel`

Or, overwrite existing files 
 
`docker run --rm -v $(pwd)/myapp:/skel udkyo/skel -f`

Alpine is used unless an image environment variable is set, e.g.

`docker run --rm -v ${pwd}/myapp:/skel -e image=centos udkyo/skel -f`
