using System;
using System.Collections.Generic;

namespace GoodFoodBackend.Models
{
    public partial class Discount
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public decimal? Value { get; set; }
        public int? ResteurantId { get; set; }

        public virtual Restaurant Resteurant { get; set; }
    }
}
