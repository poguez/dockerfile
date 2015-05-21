## Haveged
Mejora el rendimiento y generación de entropia para aplicaciones con altos requerimientos en seguridad y criptografía.

Utiliza busybox para bajar el tamaño de la imagen base de: __264 MB__ a solo __5.95 MB__

El binario se compila desde el código de la siguiente forma:

```
wget http://www.issihosts.com/haveged/haveged-1.9.1.tar.gz
tar xvzf haveged-1.9.1.tar.gz
cd haveged-1.9.1
./configure LDFLAGS="-static"
make SHARED=0 CC='gcc -static'
cp src/haveged ../.
cd ../.
```
