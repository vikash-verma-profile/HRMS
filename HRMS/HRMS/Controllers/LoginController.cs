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
                //if condition is true come here
            
            
            }
            else
            {
                //if condition fails come here
            }
            return View();
        }
    }
}