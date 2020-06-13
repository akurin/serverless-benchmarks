#!/usr/bin/env bash

dotnet lambda package \
    --project-location src/PingPong \
    --configuration release \
    --framework netcoreapp3.1 \
    --output-package bin/ping-pong.zip
