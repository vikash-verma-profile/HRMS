using HRMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRMS.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee

        HRMSDBEntities db = new HRMSDBEntities();
        public ActionResult Index()
        {
            //get departments from table
            var departmentlist = db.tblDepartments.ToList();
            //to bind a selectlist in view
            //var selectlist = new SelectList(departmentlist, "Id", "DepartmentName");

            //to get the data in view
            ViewBag.departmentlist = departmentlist;
            //return control to view
            return View();
        }
    }
}