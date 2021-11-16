using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using HRMSAPI.Entity;
using HRMSAPI.Models;

namespace HRMSAPI.Controllers
{
    public class DashBoardController : ApiController
    {
        HRMSDBEntities db = new HRMSDBEntities();
        public DashBoard GetDashBoardData()
        {
            var dashboarddata=new DashBoard();
            var dashboardData_Results=db.GetDashboardData().FirstOrDefault();
            dashboarddata.EmployeeOnLeave = (int)dashboardData_Results.EmployeeAbsent;
            dashboarddata.EmployeePresent = (int)dashboardData_Results.EmployeePresent;
            dashboarddata.NewEmployeeCount = (int)dashboardData_Results.NewEmployeeCount;
            dashboarddata.TotalEmployee = (int)dashboardData_Results.EmployeeCount;
            return dashboarddata;
        }
    }
}
