using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using GoodFoodBackend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GoodFoodBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RestaurantController : ControllerBase
    {
        GoodFoodMasterContext dbContext = new GoodFoodMasterContext();

        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            
            return new JsonResult(dbContext.Restaurant.Include(o => o.IdNavigation));
        }

        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            try
            {
                return new JsonResult(dbContext.Restaurant.Include(o => o.IdNavigation).FirstOrDefault(res => res.Id == id));
            }
            catch
            {
                return null;
            }
        }

        [HttpGet("Dishes/{id}")]
        public ActionResult<string> GetDishes(int id)
        {
            try
            {
                return new JsonResult(dbContext.Menu.Include("Dish").FirstOrDefault(men => men.ResteurantId == id).Dish);
            }
            catch
            {
                return null;
            }
        }

        [HttpGet("Full/{id}")]
        public ActionResult<string> GetFullInfo(int id)
        {
            try
            {
                return new JsonResult(dbContext.Restaurant.Include(o => o.IdNavigation).Include(o => o.Discount).Include(o => o.Menu).FirstOrDefault(res => res.Id == id));
            }
            catch
            {
                return null;
            }
        }

        [HttpGet("Discounts/{id}")]
        public ActionResult<string> GetDiscounts(int id)
        {
            try
            {
                Discount found = dbContext.Discount.First(d => d.ResteurantId == id);
                return new JsonResult(found);
            }
            catch
            {
                return new JsonResult(null);
            }
        }

    }
}