#
# Scala and sbt Dockerfile
# copied from
# https://github.com/hseeberger/scala-sbt
#

FROM bluerogue251/rc_scala:v2.11.7

WORKDIR /root
COPY build.properties /root
COPY project/flyway.sbt /root/project/flyway.sbt
RUN sbt update

CMD "sbt"
