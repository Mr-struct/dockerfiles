FROM debian:jessie

RUN apt-get update
RUN apt-get upgrade -y

# psql client
RUN apt-get update && apt-get install -y wget
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get install -y postgresql-client-9.4

# AWS CLI and related tools
RUN apt-get install -y python3
RUN wget --quiet https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN apt-get install -y jq
RUN pip install --upgrade awscli

RUN apt-get install -y vim
RUN apt-get install -y time

# CSV Tools
RUN pip install --upgrade csvkit

# Parallel command line utility
RUN apt-get install -y bzip2
RUN apt-get install -y build-essential
RUN wget http://ftp.gnu.org/gnu/parallel/parallel-20160522.tar.bz2
RUN tar -xvjf parallel-20160522.tar.bz2
WORKDIR parallel-20160522
RUN ./configure
RUN make
RUN make install

# Git
RUN apt-get install -y git

WORKDIR /root
