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
