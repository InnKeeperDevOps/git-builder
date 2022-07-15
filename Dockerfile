FROM alpine:latest

RUN apk install buildah

WORKDIR /code

CMD /start.sh
