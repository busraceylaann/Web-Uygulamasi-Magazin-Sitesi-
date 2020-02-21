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
    public partial class kullanicigonderi : System.Web.UI.Page
    {
        public static string kullanici { get; set; }
        public static string kullaniciad { get; set; }
        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        OleDbDataReader dr;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
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

       
        protected void iptal_Click(object sender, EventArgs e)
        {
            tbadı.Text = ""; icerik.Text = "";
        }

       

        protected void kaydet_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("~/resim/" + FileUpload1.FileName));
                if (ConnectionState.Closed == baglanti.State) baglanti.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = baglanti;
                cmd.CommandText = "insert into magazinler(magazinad,magazintür,magazinicerik,magazintarih,üyeid,magazindurum,resim) Values(@magazinad,@magazintür,@magazinicerik,@magazintarih,@üyeid,@magazindurum,@resim)";
                cmd.Parameters.AddWithValue("@magazinad", tbadı.Text);
                cmd.Parameters.AddWithValue("@magazintür", DropDownList1.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@magazinicerik", icerik.Text);
                cmd.Parameters.AddWithValue("@magazintarih", DateTime.Now.ToLongDateString());
                cmd.Parameters.AddWithValue("@üyeid", id);
                cmd.Parameters.AddWithValue("@magazindurum", "onaylanmadı");
                cmd.Parameters.AddWithValue("@resim", FileUpload1.FileName);
                cmd.ExecuteNonQuery();
                //html yüzünden hata verdi source en üst satırda (ValidateRequest="false") yazdık
                baglanti.Close();
                tbadı.Text = icerik.Text = "";
            }
        }
    }
}