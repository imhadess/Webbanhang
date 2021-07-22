using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using Webbanhang.Models;
using PagedList;
using PagedList.Mvc;


namespace Webbanhang.Controllers
{
    public class AdminController : Controller
    {
        dbQLSanphamDataContext db = new dbQLSanphamDataContext();
        // GET: Admin
        public ActionResult Index()
        {

            if (Session["Taikhoanadmin"] != null)
                return View();
            else

                return RedirectToAction("Login", "Admin");

        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                ADMIN ad = db.ADMINs.SingleOrDefault(n => n.Taikhoan == tendn && n.Matkhau == matkhau);
                if (ad != null)
                {
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập  hoặc mật khẩu không đúng";
            }
            return View();
        }
        //1.hien thi danh muc san pham
        public ActionResult Sanpham(int? page)
        {
            int pagesize = 7;
            int pagenum = (page ?? 1);
            if (Session["Taikhoanadmin"] != null)
                return View(db.SANPHAMs.ToList().OrderByDescending(n => n.MaSP).ToPagedList(pagenum, pagesize));
            else
                return RedirectToAction("Login", "Admin");
        }
        //2. them moi san pham
        [HttpGet]
        public ActionResult Themmoisanpham()
        {
            if (Session["Taikhoanadmin"] != null)
            {
                //Dua du lieu vao dropdownList
                //Lay ds tu tabke chu de, sắp xep tang dan trheo ten chu de, chon lay gia tri Ma CD, hien thi thi Tenchude
                ViewBag.MADM = new SelectList(db.DANHMUCSPs.ToList().OrderBy(n => n.TENDM), "MADM", "TENDM");
                ViewBag.MaHANGSX = new SelectList(db.HANGSXes.ToList().OrderBy(n => n.TENHANG), "MaHANGSX", "TENHANG");
                return View();
            }
            else
                return RedirectToAction("Login", "Admin");
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoisanpham(SANPHAM sanpham, HttpPostedFileBase fileUpload)
        {

            //Dua du lieu vao dropdownload
            ViewBag.MADM = new SelectList(db.DANHMUCSPs.ToList().OrderBy(n => n.TENDM), "MADM", "TENDM");
            ViewBag.MaHSX = new SelectList(db.HANGSXes.ToList().OrderBy(n => n.TENHANG), "MaHANGSX", "TENHANG");
            //Kiem tra duong dan file
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn hình ảnh của sản phẩm";
                return View();
            }
            //Them vao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //Luu ten fie, luu y bo sung thu vien using System.IO;
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    //Luu duong dan cua file
                    var path = Path.Combine(Server.MapPath("~/images"), fileName);
                    //Kiem tra hình anh ton tai chua?
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                    {
                        //Luu hinh anh vao duong dan
                        fileUpload.SaveAs(path);
                    }
                    sanpham.HINHSP = fileName;
                    //Luu vao CSDL
                    db.SANPHAMs.InsertOnSubmit(sanpham);
                    db.SubmitChanges();
                }
                return RedirectToAction("Sanpham","Admin");
            }
        }
        //3. xem chi tiet
        public ActionResult Chitietsanpham(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                //Lay ra doi tuong sach theo ma
                SANPHAM sanpham = db.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
                ViewBag.MaSP = sanpham.MaSP;
                if (sanpham == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return View(sanpham);
            }
        }
        //4. Xóa 1 Quyển sách 
        [HttpGet]
        public ActionResult Xoasanpham(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                var sach = from s in db.SANPHAMs where s.MaSP == id select s;
                return View(sach.Single());
            }
        }
        [HttpPost, ActionName("Xoasanpham")]
        public ActionResult Xacnhanxoa(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                SANPHAM sanpham = db.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
                db.SANPHAMs.DeleteOnSubmit(sanpham);
                db.SubmitChanges();
                return RedirectToAction("Sanpham", "Admin");
            }
        }
        //3. xem chi tiet
        public ActionResult Suasanpham(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                //Lay ra doi tuong sach theo ma
                SANPHAM sanpham = db.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
                ViewBag.MaSP = sanpham.MaSP;
                if (sanpham == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                //Dua du lieu vao dropdownList
                //Lay ds tu tabke chu de, sắp xep tang dan trheo ten chu de, chon lay gia tri Ma CD, hien thi thi Tenchude
                ViewBag.MADM = new SelectList(db.DANHMUCSPs.ToList().OrderBy(n => n.TENDM), "MADM", "TENDM");
                ViewBag.MaHSX = new SelectList(db.HANGSXes.ToList().OrderBy(n => n.TENHANG), "MaHANGSX", "TENHANG");            
                return View(sanpham);
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasanpham(SANPHAM sanpham, HttpPostedFileBase fileUpload)
        {

            //Dua du lieu vao dropdownload
            ViewBag.MADM = new SelectList(db.DANHMUCSPs.ToList().OrderBy(n => n.TENDM), "MADM", "TENDM");
            ViewBag.MaHANGSX = new SelectList(db.HANGSXes.ToList().OrderBy(n => n.TENHANG), "MaHANGSX", "TENHANG");
            //Kiem tra duong dan file
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn hình ảnh của sản phẩm";
                return View();
            }
            //Them vao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //Luu ten fie, luu y bo sung thu vien using System.IO;
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    //Luu duong dan cua file
                    var path = Path.Combine(Server.MapPath("~/images"), fileName);
                    //Kiem tra hình anh ton tai chua?
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                    {
                        //Luu hinh anh vao duong dan
                        fileUpload.SaveAs(path);
                    }
                    sanpham.HINHSP = fileName;
                    //Luu vao CSDL
                    db.SANPHAMs.InsertOnSubmit(sanpham);
                    db.SubmitChanges();
                }
                return RedirectToAction("Sanpham", "Admin");
            }
        }
    }
}
