using HRMS.Entity;
using HRMS.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace HRMS.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Dashboard
        HRMSDBEntities db = new HRMSDBEntities();
        public async Task<ActionResult> Index()
        {
            Dashboard dashboard= new Dashboard();
            var client = new HttpClient();
            client.BaseAddress = new Uri(Common.Constants.BaseUrl);
            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage res = await client.GetAsync("DashBoard/GetDashBoardData");
            if (res.IsSuccessStatusCode)
            {
                var dashboardresponse = res.Content.ReadAsStringAsync().Result;
                dashboard = JsonConvert.DeserializeObject<Dashboard>(dashboardresponse);
            }
            return View(dashboard);
        }

        public ActionResult GetMenu()
        {
            var MenuData = db.tblMenuMasters.ToList();
            return Json(MenuData, JsonRequestBehavior.AllowGet);
        }
    }
}