using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webbanhang.Models;
using System.IO;
using PagedList;
using PagedList.Mvc;
using System.Data.Entity;

namespace Webbanhang.Controllers
{
    public class AdminController : Controller
    {
        dbQLSanphamDataContext db = new dbQLSanphamDataContext();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            //gan cac gia tri nguoi dung nhap du lieu cho cac bien
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "p-Phải nhập mật Khẩu";
            }
            else
            {
                // gán gía trị cho đối tượng được tạo mới(ad)
                ADMIN ad = db.ADMINs.SingleOrDefault(n => n.Taikhoan == tendn && n.Matkhau == matkhau);
                if (ad != null)
                {
                    //ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";               
            }
            return View();
        }
    }
}