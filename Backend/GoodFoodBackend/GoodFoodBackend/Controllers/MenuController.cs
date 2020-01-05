using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GoodFoodBackend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MenuController : ControllerBase
    {
        GoodFoodMasterContext dbContext = new GoodFoodMasterContext();

        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new JsonResult(dbContext.Menu);
        }

        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return new JsonResult(dbContext.Menu.Include(o => o.Dish).First(d => d.Id == id));
        }

        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}