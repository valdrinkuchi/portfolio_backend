FROM alpine:3.13

WORKDIR /opt


RUN apk add --update \
build-base \
libxml2-dev \
libxslt-dev \
postgresql-dev \
&& rm -rf /var/cache/apk/*
RUN apk add --no-cache tzdata
# RUN ls /usr/share/zoneinfo
# RUN cp /usr/share/zoneinfo/Europe/Tallinn /etc/localtime
# RUN echo "Europe/Tallinn" > /etc/timezone

COPY . .

# RUN bundle install

# ENV env_var_ip_address=0.0.0.0
RUN chmod +x ./bin/*
ENV RAILS_ENV=production

# CMD rails s -b ${env_var_ip_address}
CMD [ "bin/setup.sh" ]
