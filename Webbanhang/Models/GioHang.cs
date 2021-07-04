using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Webbanhang.Models;

namespace Webbanhang.Models
{
    public class Giohang
    {
        //Tao doi tuong data chua dữ liệu từ model dbBansach đã tạo. 
        dbQLSanphamDataContext data = new dbQLSanphamDataContext();
        public int iMaSP { set; get; }
        public string sTenSP { set; get; }
        public string sHinhSP { set; get; }
        public Double dGiaSP { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get { return iSoluong * dGiaSP; }

        }
        //Khoi tao gio hàng theo Masach duoc truyen vao voi Soluong mac dinh la 1
        public Giohang(int Masp)
        {
            iMaSP = Masp;
            SANPHAM sanpham = data.SANPHAMs.Single(n => n.MaSP == iMaSP);
            sTenSP = sanpham.TENSP;
            sHinhSP = sanpham.HINHSP;
            dGiaSP = double.Parse(sanpham.GIASP.ToString());
            iSoluong = 1;
        }
    }
}