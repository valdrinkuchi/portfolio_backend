FROM ruby:3.0.0-alpine

WORKDIR /opt

RUN apk add --update \
build-base \
libxml2-dev \
libxslt-dev \
postgresql-dev \
&& rm -rf /var/cache/apk/*
RUN apk add --no-cache tzdata
RUN ls /usr/share/zoneinfo
RUN cp /usr/share/zoneinfo/Europe/Tallinn /etc/localtime
RUN echo "Europe/Tallinn" > /etc/timezone

COPY . .
RUN gem install bundler:2.2.19
RUN bundle install
ENV PATH="bin/scripts:${PATH}"
ENV RAILS_ENV=production

RUN chmod +x ./bin/scripts/*

CMD ["setup.sh"]