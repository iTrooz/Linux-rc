#!/bin/sh

latest_tag=$(curl -s https://api.github.com/repos/torvalds/linux/tags | jq -r '.[0].name')
>&2 echo "Latest tag from the Linux kernel upstream is $latest_tag"
echo $latest_tag
