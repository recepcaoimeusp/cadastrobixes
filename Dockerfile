FROM ruby:2.7.1-alpine

ENV PORT=3000 \
  APP_PATH=/usr/src/app \
  HOST=0.0.0.0 \
  RAILS_ENV=development

WORKDIR ${APP_PATH}

RUN apk add --update \
  build-base git bash tzdata libxml2 postgresql-dev gcompat && \
  gem install nokogiri -v '1.15.5' && \
  gem install net-imap -v '0.3.7' && \
  gem install rails

COPY . ./

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE ${PORT}

CMD rails server -b ${HOST}
# CMD tail -f /dev/null
