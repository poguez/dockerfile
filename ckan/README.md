### CKAN
CKAN environment based in docker containers, sample usage:

```sh
# Postgres
docker run \
  --name postgres \
  -e POSTGRES_USER=ckan \
  -e POSTGRES_PASSWORD=ckan \
  --rm -P postgres

# Solr
docker run \
  --name solr \
  --rm -it -p 8983:8983 mxabierto/ckan-solr

# CKAN
docker run --rm -itP \
  -e SOLR_URL=http://10.10.20.20:8983 \
  -e POSTGRESQL_CONN=ckan:ckan@10.10.20.21:5432/ckan \
  mxabierto/ckan
```
