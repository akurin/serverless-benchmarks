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
    npx slsart script -e $ServiceEndpoint/ping -d 30 -r 10 -t 25 && \
    npx slsart invoke --stage $stage --region $region &&
    rm script.yml)
```

### .NET Core 3.1

TODO

### .NET Core 5.0

TODO