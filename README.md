# docker-build-and-run

build a dockerfile run it without leaving an image or container behind

```
usage: dbr <dockerfile=DOCKERFILE> <build-context-dir=.> <command>...
example: dbr
example: dbr my.Dockerfile ./my-build-dir ls -l
```

## Installation

```sh
sudo curl -o /usr/local/bin/dbr https://raw.githubusercontent.com/qpwo/docker-build-and-run/main/docker-build-and-run.sh
sudo chmod +x /usr/local/bin/dbr
```
