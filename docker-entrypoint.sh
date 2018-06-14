#!/bin/bash

/watcher.sh &

chmod -R 777 /srv/ezmaster-jekyll/ezmaster-site/

if [ ! -f /srv/ezmaster-jekyll/ezmaster-site/_config.yml ]; then
  jekyll new ezmaster-site
fi

exec jekyll serve --skip-initial-build --source /srv/ezmaster-jekyll/ezmaster-site/
