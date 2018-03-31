# skel
Simple container for generating a Dockerfile + entrypoint script with dumb-init ready to go.

## Usage:

Create new files in ./myapp 

`docker run --rm -v $(pwd)/myapp:/skel udkyo/skel`

Overwrite existing files 
 
`docker run --rm -v $(pwd)/myapp:/skel udkyo/skel -f`

Alpine is used unless an image environment variable is set, e.g.

`docker run --rm -v ${pwd}/myapp:/skel -e image=centos udkyo/skel -f`
