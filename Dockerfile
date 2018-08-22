FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

# Install aptly and required tools
RUN apt-get -q update			\
&&  apt-get -y upgrade			\
&&  apt-get -y install aptly		\
&&  apt-get -y autoremove		\
&&  apt-get -y clean

COPY aptly.conf /etc/aptly.conf

VOLUME ["/var/lib/aptly"]

CMD ["bash"]
