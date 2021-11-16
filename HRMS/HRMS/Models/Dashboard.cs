using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS.Models
{
    public class Dashboard
    {
        public int TotalEmployee { get; set; }
        public int EmployeeOnLeave { get; set; }
        public int NewEmployeeCount { get; set; }
        public int EmployeePresent { get; set; }
    }
}