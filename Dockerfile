FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /xy-inc
WORKDIR /xy-inc
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
COPY . .
