# Alpine Linux

Builds a minimal base image based on the [Alpine Linux distribution](http://alpinelinux.org).
This builder is based on the [Gliderlabs version](https://github.com/gliderlabs/docker-alpine)

## Options

The builder takes the following options:

* `-r <release>`: The release tag to use (such as `edge` or `v3.1`)
* `-s`: Outputs the `rootfs.tar.gz` to stdout.

Example to build a base docker image for Alpine 3.2:

```
docker build -f builder-image -t mxabierto/alpine-builder .
docker run --rm mxabierto/alpine-builder -r v3.2 -s > rootfs.tar.gz
docker build -t mxabierto/alpine .
rm rootfs.tar.gz
```

Run the base image to try it out:

```
docker run -it --rm mxabierto/alpine
```