#!/bin/sh

latest_tag=$(curl -s https://api.github.com/repos/torvalds/linux/tags | jq -r '.[0].name')
echo $latest_tag
