#!/bin/sh

gaPidFile="/Users/Victor/apps/.logs/goagent.pid"

if [ ! -f "$gaPidFile" ]; then
    echo "GoAgent is not running."
    exit 1
fi

cat "$gaPidFile" | xargs kill -9
rm "$gaPidFile"
exit 0
