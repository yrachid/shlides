FROM ubuntu:latest

RUN mkdir /shlides

WORKDIR /shlides

COPY components.sh /shlides

COPY slides /shlides

COPY controls.sh /shlides

RUN apt-get update

RUN apt-get install -y figlet

RUN apt-get install -y vim
