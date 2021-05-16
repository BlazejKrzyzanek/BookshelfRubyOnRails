FROM ruby:2.7.2
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libsqlite3-dev nodejs yarn
RUN mkdir /bookshelf
WORKDIR /bookshelf
RUN gem install rails -v '~>5.2'
EXPOSE 3000

#CMD ["rails", "server", "-b", "0.0.0.0"]
