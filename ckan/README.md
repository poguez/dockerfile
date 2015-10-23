### CKAN
CKAN environment based in docker containers, sample usage:

```sh
# Postgres
docker run \
  --name postgres \
  -e POSTGRES_USER=ckan \
  -e POSTGRES_PASSWORD=super-secure-pass \
  -d -P postgres

# Solr
docker run \
  --name ckan-solr \
  -d -p 8983:8983 mxabierto/ckan-solr

# CKAN
docker run \
  --name ckan \
  --link ckan-solr:solr \
  --link postgres:postgres \
  -d -P mxabierto/ckan
```
