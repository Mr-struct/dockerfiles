FROM bluerogue251/psql_client:v9.4-trw1

RUN apt-get install -y time
RUN apt-get install -y bzip2
RUN apt-get install -y build-essential

RUN wget http://ftp.gnu.org/gnu/parallel/parallel-20160522.tar.bz2
RUN tar -xvjf parallel-20160522.tar.bz2
WORKDIR parallel-20160522
RUN ./configure
RUN ls
RUN make
RUN make install

WORKDIR /root
