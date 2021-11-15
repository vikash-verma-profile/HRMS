using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS.Models
{
    public class Attendance
    {
        public int Id { get; set; }
        public Nullable<DateTime> CheckIn { get; set; }
        public Nullable<DateTime> CheckOut { get; set; }
        public bool IsCheckedIn { get; set; }
    }
}