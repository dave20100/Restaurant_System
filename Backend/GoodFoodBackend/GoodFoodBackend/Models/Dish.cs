using System;
using System.Collections.Generic;

namespace GoodFoodBackend.Models
{
    public partial class Dish
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal? Price { get; set; }
        public decimal? Kcal { get; set; }
        public string Picture { get; set; }
        public int? MenuId { get; set; }

        public virtual Menu Menu { get; set; }
    }
}
