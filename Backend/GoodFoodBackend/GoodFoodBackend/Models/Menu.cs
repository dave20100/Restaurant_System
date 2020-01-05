using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace GoodFoodBackend.Models
{
    public partial class Menu
    {
        public Menu()
        {
            Dish = new HashSet<Dish>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Description { get; set; }
        public int? ResteurantId { get; set; }
        [JsonIgnore]
        public virtual Restaurant Resteurant { get; set; }
        [JsonIgnore]
        public virtual ICollection<Dish> Dish { get; set; }
    }
}
