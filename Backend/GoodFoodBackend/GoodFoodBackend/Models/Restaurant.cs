using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace GoodFoodBackend.Models
{
    public partial class Restaurant
    {
        public Restaurant()
        {
            Discount = new HashSet<Discount>();
            Menu = new HashSet<Menu>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public virtual Location IdNavigation { get; set; }
        public virtual ICollection<Discount> Discount { get; set; }
        public virtual ICollection<Menu> Menu { get; set; }
    }
}
