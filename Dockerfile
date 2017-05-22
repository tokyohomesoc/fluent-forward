FROM fluent/fluentd:latest
MAINTAINER Tokyo HOME SOC <github@homesoc.tokyo>

# Environment variable
ARG TIMEZONE=Asia/Tokyo

WORKDIR /home/fluent

RUN \
	   apk add --no-cache --virtual .build-tzdata \
	   		tzdata \
	&& cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
	&& apk del .build-tzdata \
	&& apk add --no-cache \
	   		curl \
			bash \
	&& apk add --no-cache --virtual .build-gem \
			git \
			ruby-dev \
			build-base \
			libcurl \
	&& chown -R fluent:fluent /fluentd/etc/ \
	\
	&& gem install fluent-plugin-s3 --no-ri --no-rdoc \
	&& gem install fluent-plugin-slack --no-ri --no-rdoc \
	&& gem install fluent-plugin-suppress --no-ri --no-rdoc \
	&& gem install fluent-plugin-forest --no-ri --no-rdoc \
	&& apk del .build-gem

COPY /conf.d /fluentd/etc/conf.d/
COPY /fluent.conf /fluentd/etc/

CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
