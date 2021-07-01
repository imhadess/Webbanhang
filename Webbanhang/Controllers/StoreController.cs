using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webbanhang.Models;

namespace Webbanhang.Controllers
{
    public class StoreController : Controller
    {
        // GET: Store
        //tạo đối tượng chứa toàn bộ csdl từ db
        dbQLSanphamDataContext data = new dbQLSanphamDataContext();
        private List<SANPHAM> Layspmoi(int count) 
        {
            return data.SANPHAMs.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }
        public ActionResult Index()
        {
            var spmoi = Layspmoi(3);
            return View(spmoi);
        }
        public ActionResult Danhmuc()
        {
            var danhmuc = from dm in data.DANHMUCSPs select dm;
            return PartialView(danhmuc);
        }
        public ActionResult SPTheodanhmuc(int id)
        {
            var sanpham = from s in data.SANPHAMs where s.MADM==id select s;
            return View(sanpham);
        }
        public ActionResult Details(int id)
        {
            var sanpham = from s in data.SANPHAMs where s.MaSP == id select s;
            return View(sanpham.Single());
        }
    }
}