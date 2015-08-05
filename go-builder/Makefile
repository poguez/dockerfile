# Based on the article:
# https://goo.gl/bVrXjF
#
# Usage:
# IMAGE_TAG="mxabierto/sample" make

# Default value for image tag
PROJECT_TAG ?= "tmp-built"

default: builddocker

# Sample dependencies, replace with your own
setup:
	go get github.com/codegangsta/cli
	go get github.com/gin-gonic/gin
	go get gopkg.in/mgo.v2
	go get github.com/Sirupsen/logrus

buildgo: setup
	CGO_ENABLED=0 GOOS=linux go build -ldflags "-s" -a -installsuffix cgo -o main ./src

# Build final project image
# 1.- Build and use builder image to compile the app as a statically linked binary
# 2.- Copy the compiled binary and root ca-certs to the project source
# 3.- Build project specific image using the main Dockerfile
# 4.- Cleanup
builddocker:
	docker build -t tmp-builder -f ./Dockerfile.builder .
	docker run -t tmp-builder
	docker cp `docker ps -q -n=1`:/main .
	docker cp `docker ps -q -n=1`:/etc/ssl/certs/ca-certificates.crt .
	docker rm -f `docker ps -q -n=1`
	chmod 755 ./main
	docker build --rm=true --tag=${IMAGE_TAG} .
	docker rmi tmp-builder
	rm main
	rm ca-certificates.crt

run: builddocker
	docker run --rm -P ${IMAGE_TAG}
