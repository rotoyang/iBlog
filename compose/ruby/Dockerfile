FROM ruby:2.6.6
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs vim postgis imagemagick
RUN mkdir /iblog
WORKDIR /iblog
RUN gem install bundler --version "2.2.26"
COPY Gemfile /iblog/Gemfile
COPY Gemfile.lock /iblog/Gemfile.lock
ENV RAILS_ENV production
RUN bundle install
COPY . /iblog
CMD rake db:migrate assets:precompile && puma -C config/puma.rb