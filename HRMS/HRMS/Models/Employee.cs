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
        public int DepartmentId { get; set; }
        public int Gender { get; set; }
        public DateTime DOB { get; set; }
        public string Email { get; set; }
    }
}