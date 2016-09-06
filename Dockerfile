FROM debian:8
MAINTAINER 'Jakub Kwiatkowski' jakub@ajbisoft.pl
RUN apt-get update && apt-get -y install mysql-server \
	&& apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
