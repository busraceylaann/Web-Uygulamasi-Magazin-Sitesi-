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
using System.Drawing;

namespace magazin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        public static StringBuilder icerik = new StringBuilder();
        DataSet ds = new DataSet();
        OleDbDataReader dr;
        public string mad, mt, üa, mad1, mt1, üa1, mad2, mt2, üa2, mad3, mt3, üa3, mid;
        public int magazinid, magazinid2;
        public string resim;       

        void duyuru()
        {
            baglanti.Open();
            DataSet ds = new DataSet();
            string sec = "select*from duyuru";
            OleDbDataAdapter da = new OleDbDataAdapter(sec, baglanti);
            da.Fill(ds, "duyuru");
            Repeater1.DataSource = ds.Tables["duyuru"]; //sayfa yüklendiğinde veriyi duyurudan alacak.
            Repeater1.DataBind();
            Panel1.BackColor = Color.GhostWhite;
            Panel1.BorderColor = Color.Black;
            
        }

        void vericek()
        {
           
            int i = 1;
            OleDbCommand cmd = new OleDbCommand();
            string sorgu = "select m.magazinad,m.resim,m.magazinid,m.magazintarih,ü.üyekullanıcıad from magazinler as[m], üye as [ü] where m.üyeid=ü.üyeid and magazindurum='onaylandı' ORDER BY m.magazinid DESC";
            cmd = new OleDbCommand(sorgu, baglanti);
            if (baglanti.State == ConnectionState.Closed) baglanti.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (i == 1)
                {
                    mad = dr["magazinad"].ToString();
                    mt = dr["magazintarih"].ToString();
                    üa = dr["üyekullanıcıad"].ToString();
                    Image1.ImageUrl = "resim/" + dr["resim"].ToString();
                    mid = dr["magazinid"].ToString();
                }
                else if (i == 2)
                {
                    mad1 = dr["magazinad"].ToString();
                    mt1 = dr["magazintarih"].ToString();
                    üa1 = dr["üyekullanıcıad"].ToString();
                    Image2.ImageUrl = "resim/" + dr["resim"].ToString();
                }
                else if (i == 3)
                {
                    mad2 = dr["magazinad"].ToString();
                    mt2 = dr["magazintarih"].ToString();
                    üa2 = dr["üyekullanıcıad"].ToString();
                    Image3.ImageUrl = "resim/" + dr["resim"].ToString();
                }
                else if (i == 4)
                {
                    mad3 = dr["magazinad"].ToString();
                    mt3 = dr["magazintarih"].ToString();
                    üa3 = dr["üyekullanıcıad"].ToString();
                    Image4.ImageUrl = "resim/" + dr["resim"].ToString();
                }
                i++;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            duyuru();
            //lbonline.Text = "Online Kullanıcı = " + Application["OnlineZiyaretci"].ToString();
            //lbziyaret.Text = "Toplam Ziyaretci = " + Application["ToplamZiyaretci"].ToString();
            vericek();
            Label2.Text = Application.Get("ziyaretci").ToString();          
            string total = "select ip from sayac group by ip"; //group by gruplandırma
            OleDbDataAdapter dat = new OleDbDataAdapter(total, baglanti);
            DataSet datb = new DataSet();
            dat.Fill(datb, "sayac");
            Label1.Text = datb.Tables[0].Rows.Count.ToString();


        }
    }
}