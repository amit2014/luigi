# Spotify Luigi Scheduler
#
# Version 0.1

FROM debian:jessie
MAINTAINER Appuri Inc. <info@appuri.com>

RUN apt-get update
RUN apt-get install -y python python-setuptools python-dev python-distribute python-pip
RUN pip install tornado
RUN pip install mechanize
RUN mkdir -p /src/luigid
ADD . /src/luigid
RUN cd /src/luigid; python setup.py install

# Touch this to trigger rebuild of cache
ENV REFRESHED_AT 2014-10-28

CMD ["luigid"]

EXPOSE 8082
