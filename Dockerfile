FROM ubuntu:18.04
LABEL maintainer="David Pippenger <ppippeng@cisco.com"
LABEL description="Container for the awesome apltly tool"

ENV DEBIAN_FRONTEND noninteractive

# Install aptly and required tools
RUN apt-get -q update			\
&&  apt-get -y upgrade			\
&&  apt-get -y install aptly		\
&&  apt-get -y autoremove		\
&&  apt-get -y clean

COPY aptly.conf /etc/aptly.conf

VOLUME ["/var/lib/aptly"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]
