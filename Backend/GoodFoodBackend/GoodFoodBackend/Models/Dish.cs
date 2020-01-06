using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GoodFoodBackend.Models
{
    public partial class Dish
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal? Price { get; set; }
        public decimal? Kcal { get; set; }
        public string Picture { get; set; }
        public int? MenuId { get; set; }

        [JsonIgnore]
        public virtual Menu Menu { get; set; }
    }
}
