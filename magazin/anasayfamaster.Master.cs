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
    public partial class anasayfamaster : System.Web.UI.MasterPage
    {
        public StringBuilder menutut = new StringBuilder();
        public static StringBuilder iceriktut = new StringBuilder();
        public static string menuismi { get; set; }
        public static string kul { get; set; }
        public static string rütbe { get; set; }
        public static bool kontrol { get; set; }
       
        OleDbDataReader dr;
        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        void kulcek()
        {
            OleDbCommand cmd = new OleDbCommand();
            string sorgu = "select üyerütbe from üye where üyekullanıcıad='" + kul + "'";
            cmd = new OleDbCommand(sorgu,baglanti);
            if (baglanti.State == ConnectionState.Closed) baglanti.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                rütbe = dr.GetValue(0).ToString();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           

            lbgiris.Visible = true;
            lbkaydol.Visible = true;
           
            if (kontrol == true)
            {
              
                kulcek();
                if (rütbe == "Admin") lbsizdengelen.Text = "Yönetici Paneli";
                LinkButton2.Visible = true;
                lbgiris.Visible = false;
                lbkaydol.Visible = false;
                lbmoda.Visible = true;
                lbdunyamagazin.Visible = true;
                lbsizdengelen.Visible = true;
                lbunlu.Visible = true;               
                LinkButton1.Text = kul;
                adminpanel.kullanad = kul;
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("menu.xml"));
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (i == 0) menutut.Append(" <li class='sidebar-brand'>");
                    else menutut.Append(" <li>");
                    menutut.Append("<a href='sayfalar.aspx?id=" + ds.Tables[0].Rows[i]["id"] + "'>");
                    menutut.Append(ds.Tables[0].Rows[i]["ad"]);
                    menutut.Append("</a> </li>");
                }
                //sayfanın içeriği oluşturma
                string id = "0";
                if (Request.QueryString.Count > 0) id = Request.QueryString[0]; //adresimdeki değerin 0.değişkenini id aktardım
                if (baglanti.State == ConnectionState.Closed) baglanti.Open();
                string sec = "select*from menü where mno='" + id + "'";
                OleDbDataAdapter da = new OleDbDataAdapter(sec, baglanti);
                da.Fill(ds, "menü");  
                if (ds.Tables["menü"].Rows.Count > 0)
                {

                    iceriktut.Append(ds.Tables["menü"].Rows[0]["micerik"].ToString());
                    sayfalar.icerik1.Clear();
                    sayfalar.icerik1.Append(iceriktut);
                }
                
                iceriktut.Clear();

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (id == ds.Tables[0].Rows[i]["id"].ToString())
                    {
                        menuismi = ds.Tables[0].Rows[i]["ad"].ToString();
                        sayfalar.menuismi = menuismi;
                    }
                }
                baglanti.Close();

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            kontrol = false;
            LinkButton1.Visible = false;
            Response.Redirect("uyegiris.aspx");
        }

        protected void lbmoda_Click(object sender, EventArgs e)
        {
            Response.Redirect("moda.aspx");
        }

        protected void lbdunyamagizin_Click(object sender, EventArgs e)
        {
            Response.Redirect("dunyamagazini.aspx");
        }

        

        protected void lbunlu_Click(object sender, EventArgs e)
        {
            Response.Redirect("unludunyasi.aspx");
        }

        protected void lbsizdengelen_Click(object sender, EventArgs e)
        {
            if (rütbe == "Admin")
            {
                
                Response.Redirect("adminanasayfa.aspx");
            }
            else
            {
                Response.Redirect("kullanicigonderi.aspx");
            }

        }

        protected void lbgiris_Click(object sender, EventArgs e)
        {
            Response.Redirect("uyegiris.aspx");
        }

        protected void lbkaydol_Click(object sender, EventArgs e)
        {
            Response.Redirect("uyekayit.aspx");
        }
    }
}