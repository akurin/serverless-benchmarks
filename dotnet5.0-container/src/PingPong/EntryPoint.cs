using Amazon.Lambda.AspNetCoreServer;

namespace PingPong
{
    public class EntryPoint : APIGatewayProxyFunction<Startup>
    {
    }
}