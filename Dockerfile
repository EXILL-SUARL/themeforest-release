FROM debian:stable

# update package list
RUN apt update

# install packages
RUN apt install sudo curl -y

# install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash && apt install nodejs -y

# create a temporary directory for processing and storing files and set it as ENV
ARG TMPDIR="/tmp/temporary-dir"

ENV TMPDIR=$TMPDIR

RUN mkdir $TMPDIR

# copy executables to bin directory
COPY workflow /usr/local/bin

COPY post-run.sh /usr/local/bin
