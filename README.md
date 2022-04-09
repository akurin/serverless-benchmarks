# Serverless benchmarks

```bash
stage=bench
region=eu-central-1

(cd benchmarks && npx slsart deploy --stage $stage --region $region)

# execute sls deploy here

ServiceEndpoint=$(aws cloudformation describe-stacks \
    --stack-name "ping-pong-$stage" \
    --region $region \
    --query "Stacks[0].Outputs[?OutputKey=='ServiceEndpoint'].OutputValue" --output text)

(cd benchmarks && \
    npx slsart script -e $ServiceEndpoint/ping -d 10 -r 1 -t 25 && \
    npx slsart invoke --stage $stage --region $region &&
    rm script.yml)
```

--msbuild-parameters /p:PublishReadyToRun=true

### .NET Core 3.1

```bash
(cd dotnet3.1 && ./build.sh && sls deploy --stage $stage --region $region)
```

```json
{
  "timestamp": "2020-06-13T18:54:02.226Z",
  "scenariosCreated": 148,
  "scenariosCompleted": 148,
  "requestsCompleted": 148,
  "latency": {
    "min": 23.1,
    "max": 133.6,
    "median": 27.8,
    "p95": 38.5,
    "p99": 54.5
  },
  "rps": {
    "count": 148,
    "mean": 13.57
  },
  "scenarioDuration": {
    "min": 25.7,
    "max": 136.1,
    "median": 30.5,
    "p95": 43.9,
    "p99": 57.8
  },
  "scenarioCounts": {
    "0": 148
  },
  "errors": {},
  "codes": {
    "200": 148
  },
  "matches": 0,
  "customStats": {},
  "phases": [
    {
      "duration": 10,
      "arrivalRate": 1,
      "rampTo": 25
    }
  ]
}

```

### .NET Core 3.1 Self-contained

```bash
(cd dotnet3.1-self-contained && ./build.sh && sls deploy --stage $stage --region $region)
```

```json
{
  "timestamp": "2020-06-13T19:09:17.974Z",
  "scenariosCreated": 150,
  "scenariosCompleted": 150,
  "requestsCompleted": 150,
  "latency": {
    "min": 23.1,
    "max": 1289.9,
    "median": 30.8,
    "p95": 53.5,
    "p99": 1286.5
  },
  "rps": {
    "count": 150,
    "mean": 13.6
  },
  "scenarioDuration": {
    "min": 25.7,
    "max": 1425.5,
    "median": 34,
    "p95": 57.6,
    "p99": 1292.1
  },
  "scenarioCounts": {
    "0": 150
  },
  "errors": {},
  "codes": {
    "200": 150
  },
  "matches": 0,
  "customStats": {},
  "phases": [
    {
      "duration": 10,
      "arrivalRate": 1,
      "rampTo": 25
    }
  ]
}
```

### .NET Core 3.1 Self-contained R2R

```bash
(cd dotnet3.1-self-contained-r2r && ./build.sh && sls deploy --stage $stage --region $region)
```

```json
{
  "timestamp": "2020-06-13T19:24:20.789Z",
  "scenariosCreated": 158,
  "scenariosCompleted": 158,
  "requestsCompleted": 158,
  "latency": {
    "min": 24.8,
    "max": 1241.3,
    "median": 31.8,
    "p95": 49.7,
    "p99": 1164.3
  },
  "rps": {
    "count": 158,
    "mean": 13.73
  },
  "scenarioDuration": {
    "min": 27.3,
    "max": 1243.9,
    "median": 34.8,
    "p95": 52.7,
    "p99": 1167.2
  },
  "scenarioCounts": {
    "0": 158
  },
  "errors": {},
  "codes": {
    "200": 158
  },
  "matches": 0,
  "customStats": {},
  "phases": [
    {
      "duration": 10,
      "arrivalRate": 1,
      "rampTo": 25
    }
  ]
}

```

### .NET Core 5.0 Self-contained R2R

```bash
(cd dotnet5.0-self-contained-r2r && ./build.sh && sls deploy --stage $stage --region $region)
```

```json
{
  "timestamp": "2020-06-13T21:28:29.898Z",
  "scenariosCreated": 135,
  "scenariosCompleted": 135,
  "requestsCompleted": 135,
  "latency": {
    "min": 29,
    "max": 1582,
    "median": 41.2,
    "p95": 1300.5,
    "p99": 1546.8
  },
  "rps": {
    "count": 135,
    "mean": 12.61
  },
  "scenarioDuration": {
    "min": 32.3,
    "max": 1584.7,
    "median": 43.6,
    "p95": 1303.5,
    "p99": 1550.6
  },
  "scenarioCounts": {
    "0": 135
  },
  "errors": {},
  "codes": {
    "200": 135
  },
  "matches": 0,
  "customStats": {},
  "phases": [
    {
      "duration": 10,
      "arrivalRate": 1,
      "rampTo": 25
    }
  ]
}
```
### .NET Core 5.0 Container Image

```bash
(
cd dotnet5.0-container &&
dotnet publish --configuration Release &&
aws ecr get-login-password --region eu-central-1 | podman login --username AWS --password-stdin 573446657092.dkr.ecr.eu-central-1.amazonaws.com &&
podman build -t pingpong . &&
podman tag pingpong:latest 573446657092.dkr.ecr.eu-central-1.amazonaws.com/pingpong:latest &&
podman push 573446657092.dkr.ecr.eu-central-1.amazonaws.com/pingpong:latest -f v2s2 &&
sls deploy --stage $stage --region $region
)
```

```json
{
  "timestamp": "2021-01-30T21:39:31.283Z",
  "scenariosCreated": 139,
  "scenariosCompleted": 139,
  "requestsCompleted": 139,
  "latency": {
    "min": 54.1,
    "max": 2375,
    "median": 61.4,
    "p95": 1936.2,
    "p99": 2275.2
  },
  "rps": {
    "count": 139,
    "mean": 12.36
  },
  "scenarioDuration": {
    "min": 56.6,
    "max": 2568.7,
    "median": 64.6,
    "p95": 1938.9,
    "p99": 2301.9
  },
  "scenarioCounts": {
    "0": 139
  },
  "errors": {},
  "codes": {
    "200": 139
  },
  "matches": 0,
  "customStats": {},
  "phases": [
    {
      "duration": 10,
      "arrivalRate": 1,
      "rampTo": 25
    }
  ]
}
```

### .NET 6

```bash
(cd dotnet6.0 && ./build.sh && sls deploy --stage $stage --region $region)
```

```
http.codes.200: ................................................................ 159
http.request_rate: ............................................................. 18/sec
http.requests: ................................................................. 159
http.response_time:
  min: ......................................................................... 16
  max: ......................................................................... 941
  median: ...................................................................... 23.8
  p95: ......................................................................... 49.9
  p99: ......................................................................... 772.9
http.responses: ................................................................ 159
vusers.completed: .............................................................. 159
vusers.created: ................................................................ 159
vusers.created_by_name.0: ...................................................... 159
vusers.failed: ................................................................. 0
vusers.session_length:
  min: ......................................................................... 36.4
  max: ......................................................................... 968.2
  median: ...................................................................... 47.9
  p95: ......................................................................... 74.4
  p99: ......................................................................... 820.7
  ```