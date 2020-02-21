using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Text;

namespace magazin
{
    public partial class adminpanel : System.Web.UI.MasterPage
    {
        public static string kullanad { get; set; }
        public StringBuilder menutut = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("menu.xml"));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (i == 0) menutut.Append(" <li class='sidebar-brand'>");
                else menutut.Append(" <li>");
                menutut.Append("<a href='adminpanel.Master?id=" + ds.Tables[0].Rows[i]["id"] + "'>");
                menutut.Append(ds.Tables[0].Rows[i]["Ad"]);
                menutut.Append("</a> </li>");
            }
            if (anasayfamaster.rütbe == "Admin")
            {
                LinkButton1.Visible = LinkButton2.Visible = true;
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (anasayfamaster.rütbe == "Admin")
            {
                Response.Redirect("kullaniciayarlari.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (anasayfamaster.rütbe == "Admin")
            {
                Response.Redirect("editor.aspx");
            }
        }
    }
}