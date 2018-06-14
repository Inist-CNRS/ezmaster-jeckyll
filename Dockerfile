FROM jekyll/jekyll:3.8

RUN mkdir -p /srv/ezmaster-jekyll/
RUN chmod 777 /srv/ezmaster-jekyll/

WORKDIR /srv/ezmaster-jekyll/
COPY Gemfile /srv/ezmaster-jekyll/
RUN bundle install

COPY watcher.sh /

RUN echo '{ \
  "httpPort": 4000, \
  "configPath": "/srv/ezmaster-jekyll/ezmaster-site/_config.yml", \
  "configType": "text", \
  "dataPath": "/srv/ezmaster-jekyll/ezmaster-site/" \
}' > /etc/ezmaster.json

COPY docker-entrypoint.sh /
CMD [ "/docker-entrypoint.sh" ]
