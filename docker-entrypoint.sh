#!/bin/bash

/watcher.sh &

chmod -R 777 /srv/ezmaster-jekyll/ezmaster-site/

if [ ! -d /srv/ezmaster-jekyll/ezmaster-site/_posts/ ]; then
  jekyll new --force ezmaster-site
fi

exec jekyll serve --skip-initial-build --source /srv/ezmaster-jekyll/ezmaster-site/
