#!/bin/sh

gaFolder="$(cd `dirname $0`/../; pwd)"
# echo "GoAgent path: " $gaFolder

gaLogPath="$gaFolder/logs"
gaPyFile="$gaFolder/src/local/proxy.py"
gaLogFile="$gaLogPath/goagent.log"
gaPidFile="$gaLogPath/goagent.pid"

if [ ! -d "$gaLogPath" ]; then
    mkdir "$gaLogPath"
fi

if [ ! -f "$gaPyFile" ]; then
    echo "ERROR: $gaPyfile is not exit!"
    exit 1
fi

if [ -f "$gaPidFile" ]; then
    echo "GoAgent is already running. Ignore this command."
    exit 0
fi

nohup python "$gaPyFile" > "$gaLogFile" &
echo $! > "$gaPidFile"
echo "GoAgent is started."
exit 0
