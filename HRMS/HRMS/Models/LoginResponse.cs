using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS.Models
{
    public class LoginResponse
    {
        public bool IsLogin { get; set; }
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
    }
}