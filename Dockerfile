FROM ruby:2.7

ENV TZ=America/Sao_Paulo

RUN apt-get update -qq && apt-get install -y \
  gcc \
  musl-dev \
  bash \
  tzdata \
  ruby-dev \
  libxml2-dev \
  libxslt-dev; \
  cp /usr/share/zoneinfo/$TZ /etc/localtime; \
  echo $TZ > /etc/timezone;

RUN mkdir /accounting_challenge
WORKDIR /accounting_challenge
COPY . /accounting_challenge