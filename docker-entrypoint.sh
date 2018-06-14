#!/bin/bash

/watcher.sh &

if [ ! -d /srv/ezmaster-jekyll/ezmaster-site/_posts/ ]; then
  jekyll new --force ezmaster-site
fi

chmod -R 777 /srv/ezmaster-jekyll/ezmaster-site/

exec jekyll serve --skip-initial-build --source /srv/ezmaster-jekyll/ezmaster-site/
