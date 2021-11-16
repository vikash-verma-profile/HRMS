using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMSAPI.Models
{
    public class DashBoard
    {
        public int TotalEmployee { get; set; }
        public int EmployeeOnLeave { get; set; }
        public int NewEmployeeCount { get; set; }
        public int EmployeePresent { get; set; }
    }
}