using HRMS.Entity;
using HRMS.Models;
using System.Linq;
using System.Web.Mvc;
using HRMS.Common;
using System;
using System.Data.Entity;

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

            tblEmployee tblEmployee = new tblEmployee();
            tblEmployee.EmployeeName = employee.EmployeeName;
            tblEmployee.DepartmentId = employee.DepartmentId;
            tblEmployee.Gender = employee.Gender;
            tblEmployee.DOB = employee.DOB.ToShortDateString();

            //added employee object inside db
            db.tblEmployees.Add(tblEmployee);
            db.SaveChanges();
            //updated Employee id in db
            tblEmployee.EmployeeId = "RNO000" + tblEmployee.Id;
            db.Entry(tblEmployee).State = EntityState.Modified;
            db.SaveChanges();

            //Creating login for user
            tblLogin tblLogin = new tblLogin();
            tblLogin.EmployeeId = tblEmployee.Id;
            tblLogin.UserName= employee.Email;
            tblLogin.Password = "123456";

            //added login to db
            db.tblLogins.Add(tblLogin);
            db.SaveChanges();

            //returning back to employeeList

            return View();
        }
    }
}