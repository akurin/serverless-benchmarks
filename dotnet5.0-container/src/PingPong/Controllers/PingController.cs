using Microsoft.AspNetCore.Mvc;

namespace PingPong.Controllers
{
    [ApiController]
    [Route("ping")]
    public class PingController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get() => Ok("pong");
    }
}