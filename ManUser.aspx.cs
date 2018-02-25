using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NotifRmdr"] == null && Session["NotifExp"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (Session["NotifRmdr"] != null && Session["NotifExp"] != null)
        {
            string TotalRMdr = Session["NotifRmdr"].ToString();
            string TotalExp = Session["NotifExp"].ToString();
            Label_TipRmdr.Text = TotalRMdr;
            Label_TipExp.Text = TotalExp;
            Label_NotifRmdr.Text = TotalRMdr;
            Label_NotifExp.Text = TotalExp;
        }

        string strses = Convert.ToString(Session["New"]);

        if (strses != "admin")
            Response.Redirect("Default.aspx");
        else
        {
            LabelUser.Text = "Admin ";
            return;
        }
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }
}