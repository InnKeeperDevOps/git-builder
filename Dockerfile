FROM ubuntu:latest

RUN apt install buildah git

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /src

CMD /start.sh
