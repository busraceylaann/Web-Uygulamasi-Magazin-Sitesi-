using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.OleDb;
using System.Data;
using System.Configuration;

namespace magazin
{
    public class Global : System.Web.HttpApplication
    {
        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);

        protected void Application_Start(object sender, EventArgs e)
        {// Uygulama ilk çalıştığında ziyaretci değişkenimi sıfırlıyorum.
            Application["ziyaretci"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {// Kullanıcı herhangi bir sayfadan siteme ziyarete geldiğinde ziyaretci değişkenime +1 ekliyorum.
         //Aynı anda 2 veya daha fazla kullanıcı ziyaretci değişkenime değer ataması yapmasın diye Application.Lock() ile kilitliyorum.
            Application.Lock();
            Application["ziyaretci"] = (int)Application["ziyaretci"] + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        { //yeni bir istediğin oluşmasını bildirir
            string sorgu = "insert into sayac (ip) values (@ip)";           
            OleDbCommand komut = new OleDbCommand(sorgu, baglanti);
            baglanti.Open();
            komut.Parameters.AddWithValue("@ip", Request.ServerVariables["REMOTE_ADDR"].ToString()); //gecerli sayfayı görüntüleyen kişinin ıp adresi 
            komut.ExecuteNonQuery();
            baglanti.Close();
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {// Kullanıcının sesion timeout olduğunda ziyaretci değişkenimi -1 yapıyorum.
            // Değer ataması yaptıktan sonra Application.Unlock() metodunu çağırıp değişkene yeni değer ataması için izin veriyorum.
            Application.Lock();
            Application["ziyaretci"] = (int)Application["ziyaretci"] - 1;
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {// Uygulama sonlandığında Application State değişkenimi siliyorum.
            Application.Remove("ziyaretci");
        }
    }
}