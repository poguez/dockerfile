#!/bin/sh

# Start zookeeper
service zookeeper start

# Adjust memory parameters
sed -i -e "s|DRILL_MAX_DIRECT_MEMORY=\"8G\"|DRILL_MAX_DIRECT_MEMORY=\"$DRILL_MAX_MEMORY\"|" /apache-drill/conf/drill-env.sh
sed -i -e "s|DRILL_HEAP=\"4G\"|DRILL_HEAP=\"$DRILL_HEAP\"|" /apache-drill/conf/drill-env.sh

# Datasources config storage
echo drill.exec.sys.store.provider.local.path = "/apache-drill/sources" >> /apache-drill/conf/drill-override.conf

# Configure datasources

# Start as foreground process
exec /apache-drill/bin/runbit
