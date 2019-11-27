using System;
using System.Collections.Generic;

namespace GoodFoodBackend.Models
{
    public partial class Menu
    {
        public Menu()
        {
            Dish = new HashSet<Dish>();
        }

        public int Id { get; set; }
        public string Description { get; set; }
        public int? ResteurantId { get; set; }

        public virtual Restaurant Resteurant { get; set; }
        public virtual ICollection<Dish> Dish { get; set; }
    }
}
