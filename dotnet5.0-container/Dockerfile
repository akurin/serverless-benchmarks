FROM public.ecr.aws/lambda/dotnet:5.0
WORKDIR /var/task
COPY "src/PingPong/bin/Release/netcoreapp5.0/publish/" .
CMD [ "PingPong::PingPong.EntryPoint::FunctionHandlerAsync" ]