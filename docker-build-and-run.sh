#!/usr/bin/env bash
set -euo pipefail

# if args = -h or --help, print usage
if [[ $# -eq 1 && ($1 == "-h" || $1 == "--help") ]]; then
    echo "
usage: dbr <dockerfile=DOCKERFILE> <build-context-dir=.> <command>...
example: dbr
example: dbr my.Dockerfile ./my-build-dir ls -l
https://github.com/qpwo/docker-build-and-run
"
    exit 0
fi

# dockerfile defaults to "Dockerfile"
dockerfile=${1:-Dockerfile}
# build context defaults to current directory
build_context=${2:-.}
command=${@:3}

tag="tempi_$RANDOM$RANDOM"
name="tempc_$RANDOM$RANDOM"
trap "docker rm -f $name &> /dev/null; docker rmi -f $tag &>/dev/null" EXIT
echo docker build -f $dockerfile -t $tag $build_context
docker build -f $dockerfile -t $tag $build_context
echo $'\n\n\n'
echo docker run --rm --hostname=dbr_temp --name=$name -it $tag $command
docker run --rm --hostname=dbr_temp --name=$name -it $tag $command
