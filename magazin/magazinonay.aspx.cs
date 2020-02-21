using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;


namespace magazin
{
    public partial class magazinonay : System.Web.UI.Page
    {
        OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        DataSet ds = new DataSet();
        public static string kullanici { get; set; }
        OleDbDataReader dr;
        string komut;
        void vericek(string aranan)
        {
            string seckomut = aranan;
            ds.Clear();
            if (conn.State == ConnectionState.Closed) conn.Open();
            OleDbDataAdapter da = new OleDbDataAdapter(seckomut, conn);
            da.SelectCommand.ExecuteNonQuery();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            conn.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            vericek(komut = "Select ü.üyekullanıcıad,m.magazintür,m.magazinad,m.magazintarih,m.magazinicerik,m.magazinid,m.resim from magazinler as[m],üye as [ü] where m.üyeid=ü.üyeid and magazindurum='onaylanmadı'");
        }

        protected void getir_Click(object sender, EventArgs e)
        {
            komut = "Select ü.üyekullanıcıad,m.magazintür,m.magazinad,m.magazintarih,m.magazinicerik,m.magazinid,m.resim from magazinler as[m],üye as [ü] where m.üyeid=ü.üyeid and magazintür='" + dptür.SelectedItem.ToString() + "' and magazindurum='onaylanmadı'";
            vericek(komut);
        }

        protected void onayla_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed) conn.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "update magazinler set magazindurum=@magazindurum where magazinid=" + int.Parse(tbid.Text) + "";
            cmd.Parameters.AddWithValue("@magazindurum", "onaylandı");
            cmd.ExecuteNonQuery();
            conn.Close();
            vericek(komut);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            vericek(komut);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int kayitno = GridView1.SelectedIndex + GridView1.PageIndex * GridView1.PageSize;
            tbad.Text = ds.Tables[0].Rows[kayitno]["magazinad"].ToString();
            magazintürü.Text = ds.Tables[0].Rows[kayitno]["magazintür"].ToString();
            icerik.Text = ds.Tables[0].Rows[kayitno]["magazinicerik"].ToString();
            tbid.Text = ds.Tables[0].Rows[kayitno]["magazinid"].ToString();
            Image1.ImageUrl = "resim/" + ds.Tables[0].Rows[kayitno]["resim"].ToString();
        }

        protected void sil_Click(object sender, EventArgs e)
        {

            if (conn.State == ConnectionState.Closed) conn.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "delete from magazinler where magazinid=@magazinid";
            cmd.Parameters.AddWithValue("@magazinid", int.Parse(tbid.Text));
            cmd.ExecuteNonQuery();
            conn.Close();
            vericek(komut);
            tbad.Text = "";
            tbid.Text = icerik.Text = "";
            Image1.ImageUrl = "";
        }
    }
}