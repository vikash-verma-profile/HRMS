using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS.Models
{
    public class Employee
    {
        public int Id { get; set; }
        public string EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string EmployeeDepartment { get; set; }
    }
}