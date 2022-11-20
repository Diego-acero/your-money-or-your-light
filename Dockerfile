FROM ruby:3.1.2-alpine

RUN apk add --update --no-cache  --virtual run-dependencies \
build-base \
cmake \
git \
yarn \
libpq-dev \
tzdata \
gcompat \
nodejs \
&& rm -rf /var/cache/apk/*

WORKDIR /your-money-or-your-light

RUN gem install bundler

COPY package.json yarn.lock /your-money-or-your-light/
RUN yarn install

COPY Gemfile Gemfile.lock /your-money-or-your-light/
RUN bundle install

COPY . /your-money-or-your-light/

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000
