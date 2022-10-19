FROM debian:stable

# update package list
RUN apt update

# install packages
RUN apt install sudo curl zip imagemagick -y

# install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash && apt install nodejs -y

# install Python 3 and PIP
RUN sudo apt install python3 python3-pip -y

# install markdown-to-document
RUN npm i markdown-to-document@"<1.0.0" -g

# create a temporary directory for processing and storing files and set it as ENV
ARG TMP_DIRNAME="directory"

ENV TMP_DIRNAME=$TMP_DIRNAME

ARG TMPDIR=/tmp/$TMP_DIRNAME-tmp/

ENV TMPDIR=$TMPDIR

RUN mkdir -p TMPDIR

# copy executables to bin directory
COPY workflow /usr/local/bin

COPY post-run.sh /usr/local/bin
