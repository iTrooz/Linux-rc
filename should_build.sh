#!/bin/sh

latest_tag=$(./get_latest_upstream_tag.sh)

if git tag --list | grep -q "$latest_tag"; then
    >&2 echo "Tag $latest_tag exists in the current git repository."
    >&2 echo "You should not build"
    exit 1
else
    >&2 echo "Tag $latest_tag does not exist in the current git repository."
    >&2 echo "You should build"
    exit 0
fi
