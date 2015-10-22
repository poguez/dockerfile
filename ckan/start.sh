#!/bin/sh

# Adjust config file
sed -i -e "s|#solr_url = http://127.0.0.1:8983/solr|solr_url = $SOLR_URL/solr|" /project/development.ini
sed -i -e "s|ckan.site_url =|ckan.site_url = http://localhost|" /project/development.ini
sed -i -e "s|ckan_default:pass@localhost/ckan_default|$POSTGRESQL_CONN|" /project/development.ini

# Create tables
if [ "$INIT_DBS" = true ]; then
  $CKAN_HOME/bin/paster --plugin=ckan db init -c /project/development.ini
fi

# Serve site
exec apachectl -DFOREGROUND
