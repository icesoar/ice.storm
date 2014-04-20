#!/bin/sh

appLogPath="/Users/Victor/apps/.logs"
gaPyFile="/Users/Victor/apps/goagent/src/local/proxy.py"
gaLogFile="$appLogPath/goagent.log"
gaPidFile="$appLogPath/goagent.pid"

if [ ! -d "$appLogPath" ]; then
    mkdir "$appLogPath"
fi

if [ ! -f "$gaPyFile" ]; then
    echo "ERROR: $gaPyfile is not exit!"
    exit 1
fi

if [ -f "$gaPidFile" ]; then
    echo "GoAgent is running."
    exit 0
fi

nohup python "$gaPyFile" > "$gaLogFile" &
echo $! > "$gaPidFile"
exit 0