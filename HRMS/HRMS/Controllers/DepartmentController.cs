using HRMS.Entity;
using HRMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRMS.Controllers
{
    public class DepartmentController : Controller
    {
        HRMSDBEntities db = new HRMSDBEntities();
        // GET: Department
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Department department)
        {
            tblDepartment tblDepartment = new tblDepartment();
            tblDepartment.DepartmentName = department.DepartmentName;
            db.tblDepartments.Add(tblDepartment);
            db.SaveChanges();
            return RedirectToAction("DepartmentList");
        }
        [HttpGet]
        public ActionResult DepartmentList()
        {
            var departmentlist=db.tblDepartments.ToList();
            List<Department> departments = new List<Department>();
            foreach (var item in departmentlist)
            {
                departments.Add(new Department { Id=item.Id,DepartmentName=item.DepartmentName});
            }
            return View(departments);
        }
    }
}