FROM ghcr.io/synload/buildah-root:main

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /src

CMD /start.sh
