#!/bin/bash

/watcher.sh &

if [ ! -d /srv/ezmaster-jekyll/ezmaster-site/_posts/ ]; then
  jekyll new --force ezmaster-site
  cp -rf $(bundle show minima)/_includes/ /srv/ezmaster-jekyll/ezmaster-site/
  cp -rf $(bundle show minima)/_layouts/  /srv/ezmaster-jekyll/ezmaster-site/
  cp -rf $(bundle show minima)/_sass/     /srv/ezmaster-jekyll/ezmaster-site/
  cp -rf $(bundle show minima)/assets/    /srv/ezmaster-jekyll/ezmaster-site/
fi

chmod -R 777 /srv/ezmaster-jekyll/ezmaster-site/

exec jekyll serve --skip-initial-build --source /srv/ezmaster-jekyll/ezmaster-site/
