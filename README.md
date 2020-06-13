# Serverless benchmarks

```bash
stage=bench
region=eu-central-1

(cd dotnet3.1 && ./build.sh && sls deploy --stage $stage --region $region)

ServiceEndpoint=$(aws cloudformation describe-stacks \
    --stack-name "ping-pong-$stage" \
    --region $region \
    --query "Stacks[0].Outputs[?OutputKey=='ServiceEndpoint'].OutputValue" --output text)

(cd benchmarks && npx slsart deploy --stage $stage --region $region)

(cd benchmarks && \
    npx slsart script -e $ServiceEndpoint/ping -d 10 -r 1 -t 25 && \
    npx slsart invoke --stage $stage --region $region &&
    rm script.yml)
```

### .NET Core 3.1

```
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

### .NET Core 5.0

TODO