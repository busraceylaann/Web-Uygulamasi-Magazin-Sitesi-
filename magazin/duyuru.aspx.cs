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
    public partial class duyuru : System.Web.UI.Page
    {

        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        public static string kullanici { get; set; }
        DataSet ds = new DataSet();        
        void vericek()
        {         
            string seckomut = "Select * from duyuru  where duyuruid ";
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
               kaydet.Visible = false;
            }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int kayitno = GridView1.SelectedIndex + GridView1.PageIndex * GridView1.PageSize;
            baslik.Text = ds.Tables[0].Rows[kayitno]["baslik"].ToString();
            icerik.Text = ds.Tables[0].Rows[kayitno]["aciklama"].ToString();
            tbid.Text = ds.Tables[0].Rows[kayitno]["duyuruid"].ToString();
        }
        protected void düzelt_Click(object sender, EventArgs e)
        {               
                if (baglanti.State == ConnectionState.Closed) baglanti.Open();
                OleDbCommand cmdd = new OleDbCommand();
                cmdd.Connection = baglanti;
                cmdd.CommandText = "update duyuru set baslik=@baslik,aciklama=@aciklama, yayinda=@yayindas where duyuruid=" + int.Parse(tbid.Text) + "";
                cmdd.Parameters.AddWithValue("@baslik", baslik.Text);                
                cmdd.Parameters.AddWithValue("@aciklama", icerik.Text);
                cmdd.Parameters.AddWithValue("@yayinda", cbyayinlansin.Checked);
                cmdd.ExecuteNonQuery();
                baglanti.Close();
                vericek();           
        }
        protected void ekle_Click(object sender, EventArgs e)
        {
            tbid.Text = baslik.Text = icerik.Text = "";
            kaydet.Visible = true;
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            vericek();
        }
        protected void kaydet_Click(object sender, EventArgs e)
        {
            if (baslik.Text == "" || icerik.Text == "")
            {
                lbuyarı.Visible = true;
                lbuyarı.Text = "Lütfen tüm alanları doldurunuz";
            }
            else
            {
                lbuyarı.Visible = false;
                
                if (ConnectionState.Closed == baglanti.State) baglanti.Open();
                OleDbCommand cmd = new OleDbCommand();
                
                cmd.Connection = baglanti;
             
                cmd.CommandText = "insert into duyuru(baslik,aciklama,yayinda) Values(@baslik,@aciklama,@yayinda)";
                
                cmd.Parameters.AddWithValue("@baslik", baslik.Text);
                cmd.Parameters.AddWithValue("@aciklama", icerik.Text);
                cmd.Parameters.AddWithValue("@yayinda", cbyayinlansin.Checked);
                cmd.ExecuteNonQuery();
                //html yüzünden hata verdi source en üst satırda (ValidateRequest="false") yazdık
                baglanti.Close();
                vericek();
                
                kaydet.Visible = false;
            }
        }
        protected void sil_Click1(object sender, EventArgs e)
        {
            if (baglanti.State == ConnectionState.Closed) baglanti.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = baglanti;
            cmd.CommandText = "delete  from duyuru where duyuruid=@duyuruid";
            cmd.Parameters.AddWithValue("@duyuruid", int.Parse(tbid.Text));
            cmd.ExecuteNonQuery();
            baglanti.Close();
            vericek();
            baslik.Text = "";
            tbid.Text = icerik.Text = "";
        }
    }
    }