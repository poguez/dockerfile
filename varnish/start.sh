#!/bin/sh
varnishd \
-F \
-a :6081 \
-T :6082 \
-b ${BACKEND_PORT//tcp:} \
-s malloc,${CACHE_SIZE} \
-p default_ttl=3600 \
-p default_grace=3600
