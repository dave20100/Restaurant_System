﻿using System;
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
    public class DishController : ControllerBase
    {
        GoodFoodMasterContext dbContext = new GoodFoodMasterContext();

        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new JsonResult(dbContext.Dish);
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            try
            {
                return new JsonResult(dbContext.Dish.First(d => d.MenuId == dbContext.Menu.First(m => m.ResteurantId == id).Id));
            }
            catch
            {
                return new JsonResult(null);
            }
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}