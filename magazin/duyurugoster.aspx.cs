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
    public partial class duyurugöster : System.Web.UI.Page
    {
        public string tutbaslik;
        OleDbConnection baglanti = new OleDbConnection(ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        public StringBuilder tuticerik = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            baglanti.Open();
            DataSet ds = new DataSet();
            string gelenid = Request.QueryString["duyuruid"].ToString();
            string sec = "select * from duyuru where duyuruid=" + gelenid;
            OleDbDataAdapter da = new OleDbDataAdapter(sec, baglanti);
            da.Fill(ds, "duyuru");
            if (ds.Tables["duyuru"].Rows.Count > 0)
            {
                tutbaslik = ds.Tables["duyuru"].Rows[0]["baslik"].ToString();
                tuticerik.Append(ds.Tables["duyuru"].Rows[0]["aciklama"].ToString());
            }
        }
    }
}