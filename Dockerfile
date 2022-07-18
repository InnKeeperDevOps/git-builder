FROM ubuntu:latest

RUN sudo apt-get -y update && sudo apt-get -y install buildah git

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /src

CMD /start.sh
