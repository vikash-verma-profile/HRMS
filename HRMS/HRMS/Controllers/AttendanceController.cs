using HRMS.Entity;
using HRMS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRMS.Controllers
{
    public class AttendanceController : Controller
    {
        // GET: Attendance

        HRMSDBEntities db = new HRMSDBEntities();
        [HttpGet]
        public ActionResult Index()
        {
            Attendance attendance = new Attendance();
            int employeeId = Convert.ToInt32(Session["EmployeeId"]);
            //calling store proc and binding it to complex ttype
            GetIsCheckIn_Result result=db.GetIsCheckIn(employeeId).FirstOrDefault();
            attendance.IsCheckedIn = Convert.ToBoolean(result.CheckedIn);
            attendance.Id= result.Id;
            return View(attendance);
        }
        [HttpPost]
        public ActionResult Index(Attendance attendance)
        {
            tblAttendance tblAttendance = new tblAttendance();
            if (attendance.IsCheckedIn)
            {
                //for saving checkout  
                tblAttendance = db.tblAttendances.Where(x=>x.Id==attendance.Id).FirstOrDefault();
                tblAttendance.CheckOut = DateTime.Now;
                tblAttendance.UpdatedBy = Convert.ToInt32(Session["EmployeeId"]);
                tblAttendance.UpdatedOn = DateTime.Now;
                db.Entry(tblAttendance).State = EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                //for saving check in
                tblAttendance.CheckIn = DateTime.Now;
                tblAttendance.CreatedBy = Convert.ToInt32(Session["EmployeeId"]);
                tblAttendance.CreatedOn = DateTime.Now;
                db.tblAttendances.Add(tblAttendance);
                db.SaveChanges();
            }
            return RedirectToAction("AttendanceList");
        }
        public ActionResult AttendanceList()
        {
            var attendancelist = db.tblAttendances.ToList();
            List<Attendance> attendances = new List<Attendance>();
            foreach (var item in attendancelist)
            {
                attendances.Add(new Attendance { Id = item.Id, CheckIn = item.CheckIn, CheckOut = (item.CheckOut!=null)? item.CheckOut : null });
            }
            return View(attendances);
        }
    }
}