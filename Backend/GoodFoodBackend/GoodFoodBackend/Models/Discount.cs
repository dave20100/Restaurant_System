using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GoodFoodBackend.Models
{
    public partial class Discount
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Description { get; set; }
        public decimal? Value { get; set; }
        public int? ResteurantId { get; set; }
        [JsonIgnore]
        public virtual Restaurant Resteurant { get; set; }
    }
}
