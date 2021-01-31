#!/usr/bin/env bash

dotnet lambda package \
    --project-location src/PingPong \
    --configuration release \
    --framework netcoreapp5.0 \
    --output-package bin/ping-pong.zip \
    --msbuild-parameters "--self-contained true"