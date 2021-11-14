using HRMS.Entity;
using HRMS.Models;
using System.Linq;
using System.Web.Mvc;
using HRMS.Common;
using System;

namespace HRMS.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee

        HRMSDBEntities db = new HRMSDBEntities();
        [HttpGet]
        public ActionResult Index()
        {
            //get departments from table
            var departmentlist = db.tblDepartments.ToList();
            //to bind a selectlist in view
            //var selectlist = new SelectList(departmentlist, "Id", "DepartmentName");

            //to get the data in view
            ViewBag.departmentlist = departmentlist;
            //get value from enum to bind the dropdown

            var enumData = from Gender g in Enum.GetValues(typeof(Gender)) select new
            {
                Id = (int)g,//type casting to integer 
                Name = g.ToString() //type casting vale to string
            };
            ViewBag.genderList = enumData;
            //return control to view
            return View();
        }
        [HttpPost]
        public ActionResult Index(Employee employee)
        {
          
            return View();
        }
    }
}