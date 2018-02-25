using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;

public partial class Agen : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString);

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

        if (Session["New"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (Session["New"] != null)
        {
            string strses = Convert.ToString(Session["New"]);

            if (strses == "admin")
                LabelUser.Text = "Admin ";
            else
            {
                LabelUser.Text = "" + strses;
                addagen.Visible = false;
                GridView_Agen.Columns[9].Visible = (Session["New"] == "admin");
                ManageUserTab.Visible = false;
            }
        }
        if (!IsPostBack)
        {
            BindGridView_Agen();
        }
    }

    protected void Save_Agen_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("Images/");
        if (UploadPP_Agen.HasFile)
        {
            int filesize = UploadPP_Agen.PostedFile.ContentLength;
            if (filesize > 2097152)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Ukuran file gambar maksimal 2 Megabyte.');</script>");
            }
            else
            {
                UploadPP_Agen.SaveAs(path + UploadPP_Agen.FileName);
                string name = "~/Images/" + UploadPP_Agen.FileName;
                string s = "INSERT INTO agen(no_vendor_agen, soldto_agen, shipto_agen, produk_agen, nama_agen, alamat1_agen, alamat2_agen, kota_agen, provinsi_agen, rayon_agen, status_agen, email_agen, telp_agen, koor_agen, jmltruk_agen, kaptruk_agen, jmlpangkal_agen, jmlsalur_agen, jmltabung_agen, imgpp_agen, kapgdg_agen) VALUES('" + TextBox_vendor_agen.Text + "','" + TextBox_kode_agen.Text + "','" + TextBox_tipe_agen.Text + "','" + TextBox_produk_agen.Text + "','" + TextBox_nama_agen.Text + "','" + TextBox_alamat1_agen.Text + "','" + TextBox_alamat2_agen.Text + "','" + TextBox_kota_agen.Text + "','" + TextBox_provinsi_agen.Text + "','" + TextBox_rayon_agen.Text + "','" + TextBox_status_agen.Text + "','" + TextBox_email_agen.Text + "','" + TextBox_telp_agen.Text + "','" + TextBox_koor_agen.Text + "','" + TextBox_jmltruk_agen.Text + "','" + TextBox_kaptruk_agen.Text + "','" + TextBox_jmlpangkal_agen.Text + "','" + TextBox_jmlsalur_agen.Text + "','" + TextBox_jmltabung_agen.Text + "','" + name + "','" + TextBox_kapgdg_agen.Text + "')";

                SqlCommand cmd = new SqlCommand(s, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
        else
        {
            string s = "INSERT INTO agen(no_vendor_agen, soldto_agen, shipto_agen, produk_agen, nama_agen, alamat1_agen, alamat2_agen, kota_agen, provinsi_agen, rayon_agen, status_agen, email_agen, telp_agen, koor_agen, jmltruk_agen, kaptruk_agen, jmlpangkal_agen, jmlsalur_agen, jmltabung_agen, kapgdg_agen) VALUES('" + TextBox_vendor_agen.Text + "','" + TextBox_kode_agen.Text + "','" + TextBox_tipe_agen.Text + "','" + TextBox_produk_agen.Text + "','" + TextBox_nama_agen.Text + "','" + TextBox_alamat1_agen.Text + "','" + TextBox_alamat2_agen.Text + "','" + TextBox_kota_agen.Text + "','" + TextBox_provinsi_agen.Text + "','" + TextBox_rayon_agen.Text + "','" + TextBox_status_agen.Text + "','" + TextBox_email_agen.Text + "','" + TextBox_telp_agen.Text + "','" + TextBox_koor_agen.Text + "','" + TextBox_jmltruk_agen.Text + "','" + TextBox_kaptruk_agen.Text + "','" + TextBox_jmlpangkal_agen.Text + "','" + TextBox_jmlsalur_agen.Text + "','" + TextBox_jmltabung_agen.Text + "','" + TextBox_kapgdg_agen.Text + "')";

            SqlCommand cmd = new SqlCommand(s, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void BindGridView_Agen()
    {
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[agen]", con);

        con.Open();
        da.Fill(dt);
        con.Close();

        if (dt.Rows.Count > 0)
        {
            GridView_Agen.DataSource = dt;
            GridView_Agen.DataBind();
        }
    }
    protected void GridView_Agen_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView_Agen.DataKeys[e.RowIndex].Value.ToString();

        SqlCommand cmd = new SqlCommand("delete from [dokumen_agen] where [dokumen_agen].[id_vendor_agen]=" + id, con);
        SqlCommand cmd2 = new SqlCommand("delete from [histori_agen] where [histori_agen].[id_vendor_agen]=" + id, con);
        SqlCommand cmd3 = new SqlCommand("delete from [image_agen] where [image_agen].[id_vendor_agen]=" + id, con);
        SqlCommand cmd1 = new SqlCommand("delete from [agen] where id_vendor_agen =" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        con.Close();

        BindGridView_Agen();
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView_Agen_SelectedIndexChanged(object sender, EventArgs e)
    {
        string id_vendor_agen = GridView_Agen.SelectedValue.ToString().Trim();
        Response.Redirect("~/Profil_Agen.aspx?agen=" + id_vendor_agen);
    }


    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }
}