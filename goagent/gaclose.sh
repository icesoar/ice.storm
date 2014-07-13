#!/bin/sh

gaFolder="$(cd `dirname $0`/../; pwd)"
# echo "GoAgent path: " $gaFolder

gaLogPath="$HOME/logs"
gaPidFile="$gaLogPath/goagent.pid"

if [ ! -f "$gaPidFile" ]; then
    echo "GoAgent was not running."
    exit 1
fi

cat "$gaPidFile" | xargs kill -9
rm "$gaPidFile"
echo "GoAgent is stopped."
exit 0
