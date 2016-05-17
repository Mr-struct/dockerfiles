# USAGE:
# $ docker run \
#          --rm \
#          --volume ~/.aws:/root/.aws:ro \
#          bluerogue251/rc_new_integration_db:v1.0.0 \
#          <your new db instance name> <your new password for all db roles (both master and regular roles)> [<optional name of snapshot to restore from (otherwise latest automatic one is used)>]

FROM bluerogue251/aws-cli:v1.0.0

RUN apk --update add postgresql-client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
