using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GoodFoodBackend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GoodFoodBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiscountController : ControllerBase
    {
        GoodFoodMasterContext dbContext = new GoodFoodMasterContext();

        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new JsonResult(dbContext.Discount);
        }

        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return new JsonResult(dbContext.Discount.First(d => d.Id == id));
        }

        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}