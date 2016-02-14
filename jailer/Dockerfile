FROM java:8

WORKDIR /root
RUN wget --output-document=/root/jailer.zip https://sourceforge.net/projects/jailer/files/Jailer/Jailer_5.1/jailer_5.1.zip/download
RUN unzip jailer.zip
RUN rm jailer.zip

WORKDIR /root/jailer