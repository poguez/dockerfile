## Go Builder

Simplify the process of packing a Go application as a docker container using the simplest and smallest possible image.

By the fault the image just includes the __statically compiled binary__ of your application and the root __ca-certificates.crt__ as extracted from the base __golang__ image ( i.e. Debian Jessie ).

How to use it:

- Start with a working go project; [more information here](http://golang.org/doc/code.html)
- Use __mxabierto/go-bin-wrapper__ as the parent image for your Dockerfile unless you know what you are doing; use __Dockerfile.wrapper__ to create your own wrapper if required
- Add the __Makefile__ and __Dockerfile.builder__ files to your project
- Adjust your project dependencies on the __setup__ target on the Makefile
- Run: __IMAGE_TAG="company/app" make__

Have fun!
