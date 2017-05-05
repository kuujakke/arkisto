FROM ruby:2.4-slim

ENV RAILS_ROOT /var/www/arkisto
ENV LANG=C.UTF-8

RUN mkdir -p $RAILS_ROOT/tmp/pids
 
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile
 
COPY Gemfile.lock Gemfile.lock

RUN apt-get update -qq && apt-get install -qq build-essential libjpeg-dev libpng-dev git libpq-dev && \
    gem install bundler && \
    bundle install --without development test && \
    apt-get remove -qq --purge build-essential && \
    apt-get autoremove -qq && apt-get autoclean -qq

COPY . .
CMD bundle exec unicorn
# # CMD [ "config/containers/app_cmd.sh" ]
