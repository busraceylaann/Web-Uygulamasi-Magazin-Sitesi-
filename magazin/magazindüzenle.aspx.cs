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
    public partial class magazindüzenle : System.Web.UI.Page
    {
        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        public static string kullanici { get; set; }
        DataSet ds = new DataSet();
        OleDbDataReader dr;
        int id;
        string komut;
        void vericek(string aranan)
        {
            string seckomut = aranan;
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
           

            if (!IsPostBack)
            {
                vericek(komut = "Select ü.üyekullanıcıad,m.magazintür,m.magazinad,m.magazintarih,m.magazinicerik,m.magazinid,m.resim from magazinler as[m],üye as [ü] where m.üyeid=ü.üyeid and magazindurum='onaylandı' ORDER BY m.magazinid DESC");
            }
            else
            {
                vericek(komut = "Select ü.üyekullanıcıad,m.magazinid,m.magazintür,m.magazinicerik,m.magazinad,m.magazintarih,m.resim from magazinler as[m],üye as [ü] where m.üyeid=ü.üyeid and magazintür='" + dptür.SelectedItem.ToString() + "' and magazindurum='onaylandı' ORDER BY m.magazinid DESC");
            }
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

        protected void ekle_Click(object sender, EventArgs e)
        {
            tbid.Text = tbad.Text = icerik.Text = "";
            kaydet.Visible = true;
        }

        protected void sil_Click(object sender, EventArgs e)
        {
            if (baglanti.State == ConnectionState.Closed) baglanti.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = baglanti;
            cmd.CommandText = "delete from magazinler where magazinid=@magazinid";
            cmd.Parameters.AddWithValue("@magazinid", int.Parse(tbid.Text));
            cmd.ExecuteNonQuery();
            baglanti.Close();
            vericek(komut);
            tbad.Text = "";
            tbid.Text = icerik.Text = "";
        }

        protected void düzelt_Click(object sender, EventArgs e)
        {
            
            if (FileUpload1.HasFile)
            {                
                lbuyarı.Visible = false;
                FileUpload1.SaveAs(Server.MapPath("~/resim/" + FileUpload1.FileName));
                if (baglanti.State == ConnectionState.Closed) baglanti.Open();
                OleDbCommand cmdd = new OleDbCommand();
                cmdd.Connection = baglanti;
                cmdd.CommandText = "update magazinler set magazinad=@magazinad,magazintür=@magazintür,magazinicerik=@magazinicerik,resim=@resim where magazinid=" + int.Parse(tbid.Text) + "";
                cmdd.Parameters.AddWithValue("@magazinad", tbad.Text);
                cmdd.Parameters.AddWithValue("@magazintür", magazintürü.SelectedItem.ToString());
                cmdd.Parameters.AddWithValue("@magazinicerik", icerik.Text);
                if (FileUpload1.FileName != Image1.ImageUrl)
                {
                    cmdd.Parameters.AddWithValue("@resim", FileUpload1.FileName);
                }
                else
                {
                    cmdd.Parameters.AddWithValue("@resim", Image1.ImageUrl);
                }
                cmdd.ExecuteNonQuery();
                baglanti.Close();
                vericek(komut);
            }
            else
            {
                lbuyarı.Visible = true;
                lbuyarı.Text = "Lütfen tüm alanları doldurunuz";
            }

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

        protected void getir_Click(object sender, EventArgs e)
        {
            string seckomut =  "Select m.magazintür,m.magazinad,ü.üyekullanıcıad, m.magazinicerik ,m.magazinid from magazinler as[m],üye as [ü] where m.üyeid=ü.üyeid and magazintür='" + dptür.SelectedItem.ToString() + "' and magazindurum='onaylandı'";
            vericek(seckomut);
            tbad.Text = icerik.Text = "";
        }

        protected void kaydet_Click(object sender, EventArgs e)
        {

            if (tbad.Text == "" || icerik.Text == "")
            {
                lbuyarı.Visible = true;
                lbuyarı.Text = "Lütfen tüm alanları doldurunuz";
            }
            else
            {
                lbuyarı.Visible = false;
                FileUpload1.SaveAs(Server.MapPath("~/resim/" + FileUpload1.FileName));
                if (ConnectionState.Closed == baglanti.State) baglanti.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = baglanti;
                cmd.CommandText = "insert into magazinler(magazinad,magazintür,magazinicerik,magazintarih,üyeid,magazindurum,resim) Values(@magazinad,@magazintür,@magazinicerik,@magazintarih,@üyeid,@magazindurum,@resim)";
                cmd.Parameters.AddWithValue("@magazinad", tbad.Text);
                cmd.Parameters.AddWithValue("@magazintür", magazintürü.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@magazinicerik", icerik.Text);
                cmd.Parameters.AddWithValue("@magazintarih", DateTime.Now.ToLongDateString());
                cmd.Parameters.AddWithValue("@üyeid", id);
                cmd.Parameters.AddWithValue("@magazindurum", "onaylandı");
                cmd.Parameters.AddWithValue("@resim", FileUpload1.FileName);
                cmd.ExecuteNonQuery();
                //html yüzünden hata verdi source en üst satırda (ValidateRequest="false") yazdık
                baglanti.Close();
                vericek(komut);
                kaydet.Visible = false;
            }
        }
    }
}