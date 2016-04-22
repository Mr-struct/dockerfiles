# USAGE:
#   echo "update patient_users set name = 'teddy' where id = 4" | \
#   docker run \
#     # -i allows stdin to work
#     -i \
#     --rm \
#     # link must be aliased to :db in order for env vars in ENTRYPOINT to work
#     # because those env vars are prefixed with $DB_
#     --link name_of_db_server_container:db
#     --env PGUSER=<your pg username> \
#     --env PGDATABASE=<your pg database> \
#     --env PGPASSWORD=<your pg database> \
#     --bluerogue251/psql_client

FROM debian:jessie

RUN apt-get update && apt-get install -y wget
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get install -y postgresql-client-9.4

CMD psql