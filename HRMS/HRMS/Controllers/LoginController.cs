using HRMS.Common;
using HRMS.Entity;
using HRMS.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
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
        public async Task<ActionResult> Index(Login login)
        {
            var loginResponseObject = new LoginResponse();
            var client = new HttpClient();
            client.BaseAddress = new Uri(Constants.BaseUrl);
            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            var loginjson = JsonConvert.SerializeObject(login);
            HttpResponseMessage res = await client.PostAsync(Constants.loginendpoint, new StringContent(loginjson,Encoding.UTF8, "application/json"));
            if (res.IsSuccessStatusCode)
            {
                var loginresult = res.Content.ReadAsStringAsync().Result;
                loginResponseObject = JsonConvert.DeserializeObject<LoginResponse>(loginresult);
                if (loginResponseObject.IsLogin)
                {
                    //create a session here
                    Session["UserName"] = loginResponseObject.EmployeeName;
                    Session["EmployeeId"] = loginResponseObject.EmployeeId;
                    return RedirectToAction("Index", "Dashboard");
                }
                else
                {
                    //write login for login fail
                }
            }
            else
            {
                //write login for login fail
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