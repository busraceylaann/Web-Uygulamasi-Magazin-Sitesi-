using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

namespace magazin
{
    public partial class uyekayit : System.Web.UI.Page
    {
        OleDbConnection con = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        OleDbDataReader dr;
        OleDbCommand komut;
        protected void Page_Load(object sender, EventArgs e)
        {
            anasayfamaster.menuismi = "Üye Kayıt";
        }

        protected void btkayit_Click(object sender, EventArgs e)
        {
            if (tbsifre.Text.Count() < 4)
            {
                lbsif.Visible = true;
            }
            else
            {
                lbsif.Visible = false;
                OleDbCommand cmd2 = new OleDbCommand();
                cmd2.Connection = con;
                cmd2.CommandText = "select * from üye where üyekullanıcıad='" + tbkul.Text + "'";
                if (con.State == ConnectionState.Closed) con.Open();
                dr = cmd2.ExecuteReader();
                if (dr.Read())
                {
                    lbkul.Visible = true;

                }
                else
                {
                    if (con.State == ConnectionState.Closed) con.Open();
                    string sorgu = "INSERT INTO üye (üyead,üyesoyad,üyetelefon,üyekullanıcıad,üyesifre,üyerütbe) VALUES (@üyead,@üyesoyad,@üyetelefon,@üyekullanıcıad,@üyesifre,@üyerütbe)";
                    komut = new OleDbCommand(sorgu, con);
                    komut.Parameters.AddWithValue("@üyead", tbad.Text);
                    komut.Parameters.AddWithValue("@üyesoyad", tbsoyad.Text);
                    komut.Parameters.AddWithValue("@üyetelefon", tbtel.Text);
                    komut.Parameters.AddWithValue("@üyekullanıcıad", tbkul.Text);
                    komut.Parameters.AddWithValue("@üyesifre", tbsifre.Text);
                    komut.Parameters.AddWithValue("@üyerütbe", "Üye");

                    komut.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("uyegiris.aspx");
                }
            }
        }
    }
}