using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace GoodFoodBackend.Models
{
    public partial class Location
    {
        public int Id { get; set; }
        public string Street { get; set; }
        public string Number { get; set; }
        public string City { get; set; }
        public string PostCode { get; set; }

        [JsonIgnore]
        public virtual Restaurant Restaurant { get; set; }
    }
}
