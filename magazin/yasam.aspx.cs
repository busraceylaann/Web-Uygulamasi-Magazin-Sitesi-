using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Text;

namespace magazin
{
    public partial class yasam : System.Web.UI.Page
    {
        OleDbConnection con = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        public static StringBuilder ictemiz2 = new StringBuilder();
        DataSet ds = new DataSet();
        int magazinid;
        public string magazinad;
        void vericek()
        {
            string seckomut = "Select m.magazinid,m.magazinad,m.magazinicerik,m.magazintarih,m.resim, ü.üyekullanıcıad from magazinler as[m],üye as [ü] where ü.üyeid=m.üyeid and m.magazintür='Yaşam' and magazindurum='onaylandı' ORDER BY m.magazintarih DESC ";
            ds.Clear();
            if (con.State == ConnectionState.Closed) con.Open();
            OleDbDataAdapter da = new OleDbDataAdapter(seckomut, con);
            da.SelectCommand.ExecuteNonQuery();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            vericek();           
            ictemiz2.Clear();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            vericek();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ictemiz2.Clear();
            int kayitno = GridView1.SelectedIndex + GridView1.PageIndex * GridView1.PageSize;
            magazinid = int.Parse(ds.Tables[0].Rows[kayitno]["magazinid"].ToString());
            magazinad = ds.Tables[0].Rows[kayitno]["magazinad"].ToString();
            lbtarih.Text = ds.Tables[0].Rows[kayitno]["magazintarih"].ToString();
            ictemiz2.Append(ds.Tables[0].Rows[kayitno]["magazinicerik"].ToString());
            Image1.ImageUrl = "resim/" + ds.Tables[0].Rows[kayitno]["resim"].ToString();
        }
    }
}