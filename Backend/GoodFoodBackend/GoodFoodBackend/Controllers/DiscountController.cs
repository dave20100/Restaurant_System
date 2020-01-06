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
            try
            {
                Discount found = dbContext.Discount.First(d => d.Id == id);
                return new JsonResult(found);
            }
            catch
            {
                return new JsonResult(null);
            }
        }

        [HttpPost]
        public void Post([FromBody] Discount discount)
        {
            dbContext.Add(discount);
            dbContext.SaveChanges();
        }

        [HttpDelete("{id}")]
        public void DeleteDiscount(int id)
        {
            dbContext.Discount.Remove(dbContext.Discount.FirstOrDefault(dis => dis.Id == id));
            dbContext.SaveChanges();
        }
    }
}