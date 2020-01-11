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
    public class DishController : ControllerBase
    {
        GoodFoodMasterContext dbContext = new GoodFoodMasterContext();

        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new JsonResult(dbContext.Dish);
        }

        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            try
            {
                return new JsonResult(dbContext.Dish.First(dish => dish.Id == id));
            }
            catch
            {
                return new JsonResult(null);
            }
        }

        [HttpPost]
        public void Post([FromBody] Dish dish)
        {
            dbContext.Dish.Add(dish);
            dbContext.SaveChanges();
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            dbContext.Dish.Remove(dbContext.Dish.FirstOrDefault(di => di.Id == id));
            dbContext.SaveChanges();
        }
    }
}