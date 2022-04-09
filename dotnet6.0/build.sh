#!/usr/bin/env bash

dotnet lambda package \
    --project-location src/PingPong \
    --configuration release \
    --framework net6.0 \
    --output-package bin/ping-pong.zip
