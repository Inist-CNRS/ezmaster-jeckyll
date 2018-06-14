#!/bin/bash

while true
do
  jekyll build --watch --incremental --source /srv/ezmaster-jekyll/ezmaster-site/
  sleep 5s
done
