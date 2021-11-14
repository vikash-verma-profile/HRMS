using HRMS.Entity;
using HRMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRMS.Controllers
{
    public class LoginController : Controller
    {

        HRMSDBEntities db = new HRMSDBEntities();
        // GET: Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Login login)
        {
            if(db.tblLogins.Any(x=>x.UserName==login.UserName && x.Password == login.Password))
            {

                //create a session here
                var loginObject = db.tblLogins.Where(x => x.UserName == login.UserName && x.Password == login.Password).FirstOrDefault();
                var EmployeeObject = db.tblEmployees.Where(x => x.Id == loginObject.EmployeeId).FirstOrDefault();
                Session["UserName"] = EmployeeObject.EmployeeName;
                return RedirectToAction("Index", "Dashboard");                
            }
            else
            {
                //if condition fails come here
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session["UserName"] = "";
            Session.Abandon();
            return RedirectToAction("Index");
        }
    }
}