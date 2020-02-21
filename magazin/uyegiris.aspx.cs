using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Text;
using System.Configuration;

namespace magazin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        OleDbDataReader dr;
        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            anasayfamaster.menuismi = "Üye Girişi";
            anasayfamaster.kul = "";
            anasayfamaster.kontrol = false;
        }
       
        protected void btgiris_Click(object sender, EventArgs e)
        {
            OleDbCommand cmd = new OleDbCommand();
            string sorgu = "select* from üye where üyekullanıcıad='" + tbkul.Text + "'and üyesifre='" + tbsifre.Text + "'";
            cmd = new OleDbCommand(sorgu, baglanti);
            if (baglanti.State == ConnectionState.Closed) baglanti.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                anasayfamaster.kul = tbkul.Text;
                magazindüzenle.kullanici = tbkul.Text;
                magazinonay.kullanici = tbkul.Text;
                kullanicigonderi.kullanici = tbkul.Text;
                anasayfamaster.kontrol = true;
                Response.Redirect("anasayfa.aspx");
            }
            else
            {
                Label3.Visible = true;
            }
        }
    }
}