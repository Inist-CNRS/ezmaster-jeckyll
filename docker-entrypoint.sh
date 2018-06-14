#!/bin/bash

cd /srv/ezmaster-jekyll/

chmod -R 777 ./ezmaster-site/

if [ ! -d ./ezmaster-site/_posts/ ]; then
  jekyll new --force ezmaster-site-init
  cat ./ezmaster-site-init/_config.yml > ./ezmaster-site/_config.yml
  cp -rf ./ezmaster-site-init/* ./ezmaster-site/

  cp -rf $(bundle show minima | tail -n 1)/_includes/ ./ezmaster-site/
  cp -rf $(bundle show minima | tail -n 1)/_layouts/  ./ezmaster-site/
  cp -rf $(bundle show minima | tail -n 1)/_sass/     ./ezmaster-site/
  cp -rf $(bundle show minima | tail -n 1)/assets/    ./ezmaster-site/

  chmod -R 777 ./ezmaster-site/
fi

/watcher.sh &

exec jekyll serve --skip-initial-build --source ./ezmaster-site/
