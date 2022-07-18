FROM alpine:latest

RUN apk add buildah git

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /src

CMD /start.sh
