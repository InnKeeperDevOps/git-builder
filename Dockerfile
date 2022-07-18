FROM alpine:latest

RUN apk add buildah git

COPY start.sh /start.sh

WORKDIR /code

CMD /start.sh
