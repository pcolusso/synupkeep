#!/bin/sh

cp .crontab.docker /tmp/.crontab
sed -i "s~SYNUPKEEP_DOCKER_CRON_SCHEDULE~$SYNUPKEEP_DOCKER_CRON_SCHEDULE~g" /tmp/.crontab

stop() {
  pkill supercronic
  sleep 1
}

trap "stop" SIGTERM

supercronic /tmp/.crontab &

wait $!
