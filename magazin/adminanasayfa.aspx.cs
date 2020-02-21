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
    public partial class WebForm1 : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        DataSet ds = new DataSet();
        public static string kullanici { get; set; }
        OleDbDataReader dr;
        int id;
        void vericek()
        {
            string seckomut = "Select ü.üyekullanıcıad,m.magazintür,m.magazinad,m.magazintarih,m.resim,m.magazinid,m.magazinicerik from magazinler as[m],üye as [ü] where m.üyeid=ü.üyeid and magazindurum='onaylanmadı'";
            ds.Clear();
            if (baglanti.State == ConnectionState.Closed) baglanti.Open();
            OleDbDataAdapter da = new OleDbDataAdapter(seckomut, baglanti);
            da.SelectCommand.ExecuteNonQuery();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            baglanti.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            vericek();
            OleDbCommand cmd = new OleDbCommand();
            string sorgu = "select üyeid from üye where üyekullanıcıad='" + kullanici + "'";
            cmd = new OleDbCommand(sorgu, baglanti);
            if (baglanti.State == ConnectionState.Closed) baglanti.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = int.Parse(dr.GetValue(0).ToString());
            }
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            vericek();
        }


        protected void lnbtkul_Click(object sender, EventArgs e)
        {

            if (anasayfamaster.rütbe == "Admin")
            {
                Response.Redirect("kullaniciayarlari.aspx");

            }
            else
            {
                Label1.Visible = true;
            }
        }

        protected void lnbtsayfa_Click(object sender, EventArgs e)
        {

            if (anasayfamaster.rütbe == "Admin")
            {
                Response.Redirect("editor.aspx");
            }
            else
            {
                Label1.Visible = true;
            }
        }
    }
}