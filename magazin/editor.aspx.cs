using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using System.Xml;
using System.Xml.Linq;

namespace magazin
{
    public partial class editor : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        void oku()
        {
            ds.Clear();
            ds.ReadXml(Server.MapPath("menu.xml"));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            oku();
        }

        protected void kaydet_Click(object sender, EventArgs e)
        {
            int kayitno = GridView1.SelectedIndex;
            baglanti.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = baglanti;
            if (kayitno >= 0)
            {
             
                cmd.CommandText = "insert into menü(mno,micerik) Values(@mno,@micerik)";
                cmd.Parameters.AddWithValue("@mno", ıd.Text);
                cmd.Parameters.AddWithValue("@micerik", icerik.Text);
                cmd.ExecuteNonQuery();
                //html yüzünden hata verdi source en üst satırda (ValidateRequest="false") yazdık

            }
            baglanti.Close();
        }

        protected void sil_Click(object sender, EventArgs e)
        {
            int kayitno = GridView1.SelectedIndex;
            if (kayitno >= 0)
            {
                ds.Tables[0].Rows[kayitno].Delete();
                ds.WriteXml(Server.MapPath("menu.xml"));
                oku();
            }
            if (baglanti.State == ConnectionState.Closed) baglanti.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = baglanti;
            cmd.CommandText = "delete from menü where mno=@mno";
            cmd.Parameters.AddWithValue("@mno", ıd.Text);
            cmd.ExecuteNonQuery();
            ıd.Text = "";
            ad.Text = "";
        }

        protected void düzelt_Click(object sender, EventArgs e)
        {
            int kayitno = GridView1.SelectedIndex;
            if (kayitno >= 0)
            {
                ds.Tables[0].Rows[kayitno]["Ad"] = ad.Text;
                ds.Tables[0].Rows[kayitno]["id"] = ıd.Text;
                ds.WriteXml(Server.MapPath("menu.xml"));
                oku();
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int kayitno = GridView1.SelectedIndex;
            ad.Text = ds.Tables[0].Rows[kayitno]["Ad"].ToString();
            ıd.Text = ds.Tables[0].Rows[kayitno]["id"].ToString();
            baglanti.Open();
            string sec = "select*from menü where mno='" + ıd.Text + "'";
            OleDbDataAdapter da = new OleDbDataAdapter(sec, baglanti);
            da.Fill(ds, "menü");
            if (ds.Tables["menü"].Rows.Count > 0)
            {
                icerik.Text = ds.Tables["menü"].Rows[0]["micerik"].ToString();
            }
            else icerik.Text = "";
            baglanti.Close();
        }

        protected void ekle_Click(object sender, EventArgs e)
        {
            string id;
            XmlDocument x = new XmlDocument();// XmlDocument olusturdum içerisine Xml attım
            x.Load(Server.MapPath("menu.xml"));
            XmlNodeList du = x.SelectNodes("dikeymenu/menu"); //Daha sonra bu XmlDocument dosyasindan SelectNodes metodunu kullanarak döküman içerisindeki menu Nodelerini bir XmlNodeList listesine attım. 
            foreach (XmlNode a in du)
            {
                id = a.Attributes["id"].Value;
                if (id == ıd.Text) { Label1.Text = "Girdiğiniz Id Kullanılmaktadır."; Label1.Visible = true; }
                else Label1.Text = "";
            }
            if (Label1.Text != "Girdiğiniz Id Kullanılmaktadır.")
            {
                DataRow dr = ds.Tables[0].NewRow();
                dr["Ad"] = ad.Text;
                dr["id"] = ıd.Text;
                ds.Tables[0].Rows.Add(dr);
                ds.WriteXml(Server.MapPath("menu.xml"));
                oku();
            }
        }
    }
}