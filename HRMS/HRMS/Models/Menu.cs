using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS.Models
{
    public class Menu
    {
        public int Id { get; set; }
        public string MenuText { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public int IsParent { get; set; }
    }
}