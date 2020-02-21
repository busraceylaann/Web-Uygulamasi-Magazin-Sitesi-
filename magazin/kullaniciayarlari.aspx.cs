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
    public partial class kullaniciayarlari : System.Web.UI.Page
    {
        OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        public static string kullanici { get; set; }
        DataSet ds = new DataSet();
        OleDbDataReader dr;
        int id;
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
            vericek("Select *From üye");

            OleDbCommand cmd = new OleDbCommand();
            string sorgu = "select üyeid from üye where üyekullanıcıad='" + kullanici + "'";
            cmd = new OleDbCommand(sorgu, conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = int.Parse(dr.GetValue(0).ToString());
            }
        }

        protected void ara_Click(object sender, EventArgs e)
        {
            string komut = "Select* from üye where üyekullanıcıad like '%" + tbara.Text + "%'";
            vericek(komut);
        }

        protected void temizle_Click(object sender, EventArgs e)
        {
            vericek("Select *From üye");
        }

        protected void kaydet_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed) conn.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "update üye set üyerütbe=@üyerütbe where üyekullanıcıad='" + tbad.Text + "'";
            cmd.Parameters.AddWithValue("@üyerütbe", dprütbe.SelectedItem.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            vericek("Select *From üye");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            vericek("Select *From üye");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int kayitno = GridView1.SelectedIndex + GridView1.PageIndex * GridView1.PageSize;
            tbad.Text = ds.Tables[0].Rows[kayitno]["üyekullanıcıad"].ToString();
            tbrütbe.Text = ds.Tables[0].Rows[kayitno]["üyerütbe"].ToString();
        }

        protected void tbad0_TextChanged(object sender, EventArgs e)
        {

        }
    }
}