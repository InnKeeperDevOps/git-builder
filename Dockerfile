FROM alpine:latest

RUN apk add buildah

WORKDIR /code

CMD /start.sh
