FROM debian:9
MAINTAINER Jakub Kwiatkowski <jakub@ajbisoft.pl>
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get -yq install mysql-server \
	&& sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf \
	&& apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY docker-entrypoint.sh /
EXPOSE 3306
ENTRYPOINT ["/docker-entrypoint.sh"]
