#
# Scala and sbt Dockerfile
# copied from
# https://github.com/hseeberger/scala-sbt
#

FROM java:8

ENV SCALA_VERSION 2.11.7
ENV SBT_VERSION 0.13.8

# Install Scala
RUN \
  cd /root && \
  curl -o scala-$SCALA_VERSION.tgz http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz && \
  tar -xf scala-$SCALA_VERSION.tgz && \
  rm scala-$SCALA_VERSION.tgz && \
  echo >> /root/.bashrc && \
  echo 'export PATH=~/scala-$SCALA_VERSION/bin:$PATH' >> /root/.bashrc

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt

WORKDIR /root
COPY build.sbt /root
COPY project/flyway.sbt /root/project/flyway.sbt
RUN sbt update

ENTRYPOINT ["sbt"]
