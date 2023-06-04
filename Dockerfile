ARG RUBY_VERSION=3.2.2

FROM ruby:$RUBY_VERSION
ENV NODE_MAJOR 16
ENV YARN_VERSION 1.22.17-1
ENV RUBY_YJIT_ENABLE true

RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee /usr/share/keyrings/nodesource.gpg >/dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x bullseye main" | tee /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x bullseye main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
    curl -s https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && \
    apt install -y --no-install-recommends \
        nodejs \
        yarn=$YARN_VERSION


COPY Aptfile /tmp/Aptfile
COPY Aptfile.dev /tmp/Aptfile
RUN apt-get update -qq && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    libpq-dev \
    postgresql-client \
    $(grep -Ev '^\s*#' /tmp/Aptfile | xargs) && \
    $(grep -Ev '^\s*#' /tmp/Aptfile.dev | xargs) && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install -j $(nproc) && \
    bundle config set --local frozen 'true'

COPY . /app/

RUN RAILS_ENV=development DATABASE_URL=postgres://user@example/db bundle exec rake assets:precompile

EXPOSE 3000

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["web"]
HEALTHCHECK --start-period=30s --retries=10 --interval=30s --timeout=30s CMD curl --fail -L http://0.0.0.0:3000/healthcheck || exit 1  
