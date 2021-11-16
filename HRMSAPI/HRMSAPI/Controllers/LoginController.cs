using HRMSAPI.Entity;
using HRMSAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HRMSAPI.Controllers
{
    public class LoginController : ApiController
    {
        HRMSDBEntities db = new HRMSDBEntities();
        public LoginResponse Login(Login login)
        {
            LoginResponse loginResponse = new LoginResponse();

            if (db.tblLogins.Any(x => x.UserName == login.UserName && x.Password == login.Password))
            {
                var loginObject = db.tblLogins.Where(x => x.UserName == login.UserName && x.Password == login.Password).FirstOrDefault();
                var EmployeeObject = db.tblEmployees.Where(x => x.Id == loginObject.EmployeeId).FirstOrDefault();
                loginResponse.EmployeeName = EmployeeObject.EmployeeName;
                loginResponse.EmployeeId = EmployeeObject.Id;
                loginResponse.IsLogin = true;
            }
            else
            {
                loginResponse.IsLogin = false;
            }

            return loginResponse;
        }
    }
}
