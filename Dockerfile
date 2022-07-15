FROM alpine:latest

RUN apk add buildah git

WORKDIR /code

CMD /start.sh
