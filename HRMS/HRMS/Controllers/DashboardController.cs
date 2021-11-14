using HRMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRMS.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Dashboard
        HRMSDBEntities db = new HRMSDBEntities();
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult GetMenu()
        {
            var MenuData = db.tblMenuMasters.ToList();
            return Json(MenuData, JsonRequestBehavior.AllowGet);
        }
    }
}