FROM jekyll/jekyll:3.8

RUN mkdir -p /srv/ezmaster-jekyll/
RUN chmod 777 /srv/ezmaster-jekyll/

WORKDIR /srv/ezmaster-jekyll/
COPY Gemfile /srv/ezmaster-jekyll/
RUN bundle install

COPY watcher.sh /

COPY docker-entrypoint.sh /
CMD [ "/docker-entrypoint.sh" ]
