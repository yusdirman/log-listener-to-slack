#!/bin/bash

error_log="[path_to]/error.log"
slack_webhook_url="https://hooks.slack.com/services/[your key]"

tail -n0 -F $error_log | while read LINE; do
 (echo "$LINE" | grep -e "$3") && curl -X POST --silent --data-urlencode "payload={\"text\": \"$(echo $LINE | sed "s/\"/'/g")\"}" $slack_webhook_url;
done

