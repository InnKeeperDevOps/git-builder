FROM ghcr.io/innkeeperdevops/builder-root:main

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /src

RUN env

CMD /start.sh
