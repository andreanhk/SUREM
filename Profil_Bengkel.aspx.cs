using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Data.Sql;
using System.Configuration;

public partial class Profil_Bengkel : System.Web.UI.Page
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
                LinkButton editbtn1 = (LinkButton)FormView_ProfilBkl.FindControl("Edit_ProfilBkl");
                LinkButton editbtn2 = (LinkButton)FormView_SarfasAgen.FindControl("Edit_SarfasBkl");
                LinkButton editbtn3 = (LinkButton)FormView_KapBkl.FindControl("Edit_KapBkl");

                addnewdoc.Visible = false;
                GridView_DokBkl.Columns[7].Visible = (Session["New"] == "admin");
                GridView_DokBkl.Columns[8].Visible = (Session["New"] == "admin");
                FileUpload_galeri.Visible = false;
                Button1.Visible = false;
                ManageUserTab.Visible = false;

                Btn_EditPP_Bkl.Visible = false;
                btnaddnewgal.Visible = false;

                if (Session["New"] != "admin")
                {
                    editbtn1.Visible = false;
                    editbtn2.Visible = false;
                    editbtn3.Visible = false;
                }
            }
        }
        if (this.IsPostBack)
        {
            TabName.Value = Request.Form[TabName.UniqueID];
        }
        if (!IsPostBack)
        {
            BindGridView_Bkl();
            DetailImage();
        }
        string s = "DELETE FROM [histori_bkl] WHERE DATEDIFF(day, GETDATE(), [dateubah_histori_bkl]) = 1826";
        SqlCommand cmd = new SqlCommand(s, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    protected void Btn_savedok_bkl_Click(object sender, EventArgs e)
    {
        string vendor = Request.QueryString["bengkel"];
        string path = Server.MapPath("Images/");
        var awal1 = DateTime.ParseExact(Txt_datedoc_bkl.Text, "dd-mm-yyyy", null).ToString("yyyy-mm-dd");
        var awal2 = DateTime.ParseExact(Txt_expdoc_bkl.Text, "dd-mm-yyyy", null).ToString("yyyy-mm-dd");

        if (FileUpload_dokbkl.HasFile)
        {
            if (vendor != null)
            {
                    FileUpload_dokbkl.SaveAs(path + FileUpload_dokbkl.FileName);
                    string name = "~/Images/" + FileUpload_dokbkl.FileName;
                    string s = "INSERT INTO dokumen_bkl(noreg_dokumen_bkl, tipe_dokumen_bkl, pub_dokumen_bkl, date_dokumen_bkl, exp_dokumen_bkl,image_dokumen_bkl, id_vendor_bkl, rem_dokumen_bkl) VALUES('" + Txt_nodok_bkl.Text + "','" + Txt_tipedok_bkl.Text + "','" + Txt_pubdoc_bkl.Text + "','" + awal1 + "','" + awal2 + "','" + name + "','" + vendor + "','" + Txt_remdoc_bkl.Text + "')";
                    string sh = "INSERT INTO histori_bkl(id_vendor_bkl, aksi_bkl, dateawal_histori_bkl, dateakhir_histori_bkl, no_regdok_bkl, tipedok_bkl, pubdok_bkl, imgdok_bkl) VALUES('" + vendor + "','Tambah Dokumen Baru','" + awal1 + "','" + awal2 + "','" + Txt_nodok_bkl.Text + "','" + Txt_tipedok_bkl.Text + "','" + Txt_pubdoc_bkl.Text + "','" + name + "')";

                    SqlCommand cmd = new SqlCommand(s, con);
                    SqlCommand cmd1 = new SqlCommand(sh, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect(Request.RawUrl);
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Maaf, tidak dapat menyimpan data (error no parameter found)');</script>");
            }
        }
        else
        {
            if (vendor != null)
            {
                string s = "INSERT INTO dokumen_bkl(noreg_dokumen_bkl, tipe_dokumen_bkl, pub_dokumen_bkl, date_dokumen_bkl, exp_dokumen_bkl, id_vendor_bkl, rem_dokumen_bkl) VALUES('" + Txt_nodok_bkl.Text + "','" + Txt_tipedok_bkl.Text + "','" + Txt_pubdoc_bkl.Text + "','" + awal1 + "','" + awal2 + "','" + vendor + "','" + Txt_remdoc_bkl.Text + "')";
                string sh = "INSERT INTO histori_bkl(id_vendor_bkl, aksi_bkl, dateawal_histori_bkl, dateakhir_histori_bkl, no_regdok_bkl, tipedok_bkl, pubdok_bkl) VALUES('" + vendor + "','Tambah Dokumen Baru','" + awal1 + "','" + awal2 + "','" + Txt_nodok_bkl.Text + "','" + Txt_tipedok_bkl.Text + "','" + Txt_pubdoc_bkl.Text + "')";

                SqlCommand cmd = new SqlCommand(s, con);
                SqlCommand cmd1 = new SqlCommand(sh, con);
                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Maaf, tidak dapat menyimpan data (error no parameter found)');</script>");
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string vendor1 = Request.QueryString["bengkel"];
        string path1 = Server.MapPath("Images/");

        if (FileUpload_galeri.HasFile)
        {
            int filesize1 = FileUpload_galeri.PostedFile.ContentLength;
            if (filesize1 > 2097152)
            {
                Response.Write(@"<script language='javascript'>alert('Ukuran file lebih dari 2Mb');</script>");
            }
            else
            {
                FileUpload_galeri.SaveAs(path1 + FileUpload_galeri.FileName);
                string name1 = "~/Images/" + FileUpload_galeri.FileName;
                string s1 = "INSERT INTO image_bkl(id_vendor_bkl, img_bkl) VALUES('" + vendor1 + "','" + name1 + "')";

                SqlCommand cmd1 = new SqlCommand(s1, con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
        else
        {
        }
    }

    protected void BindGridView_Bkl()
    {
        string par = Request.QueryString["bengkel"].ToString();

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dokumen_bkl WHERE id_vendor_bkl = " + par, con);

        con.Open();
        da.Fill(dt);
        con.Close();

        if (dt.Rows.Count > 0)
        {
            GridView_DokBkl.DataSource = dt;
            GridView_DokBkl.DataBind();
        }
    }

    protected void GridView_DokBkl_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView_DokBkl.EditIndex = -1;
        BindGridView_Bkl();
    }

    protected void GridView_DokBkl_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView_DokBkl.EditIndex = e.NewEditIndex;
        BindGridView_Bkl();
    }

    protected void GridView_DokBkl_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string vendor2 = Request.QueryString["bengkel"];
        string iddok = GridView_DokBkl.DataKeys[e.RowIndex].Value.ToString();

        TextBox dokpubsp = (TextBox)GridView_DokBkl.Rows[e.RowIndex].FindControl("TextBox5");
        TextBox dokdatesp = (TextBox)GridView_DokBkl.Rows[e.RowIndex].FindControl("TextBox2");
        TextBox dokexpsp = (TextBox)GridView_DokBkl.Rows[e.RowIndex].FindControl("TextBox3");

        FileUpload FileUpload4 = (FileUpload)GridView_DokBkl.Rows[e.RowIndex].FindControl("FileUpload4");

        string path1 = "~/Images/";
        if (FileUpload4.HasFile)
        {
            path1 += FileUpload4.FileName;
            FileUpload4.SaveAs(MapPath(path1));
        }
        else
        {
            Image img = (Image)GridView_DokBkl.Rows[e.RowIndex].FindControl("img_up");
            path1 = img.ImageUrl;
        }

        SqlCommand cmd2 = new SqlCommand("UPDATE dokumen_bkl SET pub_dokumen_bkl='" + dokpubsp.Text + "', date_dokumen_bkl='" + dokdatesp.Text + "', exp_dokumen_bkl='" + dokexpsp.Text + "', image_dokumen_bkl='" + path1 + "' WHERE id_dokumen_bkl=" + iddok + "", con);
        SqlCommand cmd3 = new SqlCommand("INSERT INTO [histori_bkl] (aksi_bkl, id_vendor_bkl, dateawal_histori_bkl, dateakhir_histori_bkl, no_regdok_bkl, tipedok_bkl, pubdok_bkl, imgdok_bkl) SELECT ('Update Dokumen'), id_vendor_bkl, date_dokumen_bkl, exp_dokumen_bkl, noreg_dokumen_bkl, tipe_dokumen_bkl, pub_dokumen_bkl, image_dokumen_bkl FROM [dokumen_bkl] WHERE id_dokumen_bkl =" + iddok, con);

        con.Open();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        con.Close();

        GridView_DokBkl.EditIndex = -1;
        BindGridView_Bkl();
        Response.Redirect(Request.RawUrl);
    }

    protected void GridView_DokBkl_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView_DokBkl.DataKeys[e.RowIndex].Value.ToString();

        SqlCommand cmd1 = new SqlCommand("INSERT INTO [histori_bkl] (aksi_bkl, id_vendor_bkl, dateawal_histori_bkl, dateakhir_histori_bkl, no_regdok_bkl, tipedok_bkl, pubdok_bkl, imgdok_bkl) SELECT ('Hapus Dokumen'), id_vendor_bkl, date_dokumen_bkl, exp_dokumen_bkl, noreg_dokumen_bkl, tipe_dokumen_bkl, pub_dokumen_bkl, image_dokumen_bkl FROM [dokumen_bkl] WHERE id_dokumen_bkl =" + id, con);
        SqlCommand cmd = new SqlCommand("delete from dokumen_bkl where id_dokumen_bkl=" + id, con);
        con.Open();
        cmd1.ExecuteNonQuery();
        cmd.ExecuteNonQuery();
        con.Close();
        BindGridView_Bkl();
        Response.Redirect(Request.RawUrl);
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void GridView_HistoriBkl_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            if (drv["aksi_bkl"].ToString().Equals("Tambah Dokumen Baru"))
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#66FF99");
            }
            else if (drv["aksi_bkl"].ToString().Equals("Update Dokumen"))
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#0099FF");
            }
            else
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF9900");
            }
        }
    }

    private void DetailImage()
    {
        string par = Request.QueryString["bengkel"].ToString();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[bkl] WHERE id_vendor_bkl = " + par, con);

        DataTable table = new DataTable();

        da.Fill(table);
        DataList_ProfilBkl.DataSource = table;
        DataList_ProfilBkl.DataBind();
    }

    protected void SavePP_Bkl_Click(object sender, EventArgs e)
    {
        string vendor2 = Request.QueryString["bengkel"];
        string path2 = Server.MapPath("Images/");

        if (FileUpload1.HasFile)
        {
            int filesize1 = FileUpload1.PostedFile.ContentLength;
            if (filesize1 > 2097152)
            {
                Response.Write(@"<script language='javascript'>alert('Ukuran file lebih dari 2Mb');</script>");
            }
            else
            {
                FileUpload1.SaveAs(path2 + FileUpload1.FileName);
                string name2 = "~/Images/" + FileUpload1.FileName;
                string s2 = "UPDATE [dbo].[bkl] SET [imgpp_bkl] = '" + name2 + "' WHERE [id_vendor_bkl] = '" + vendor2 + "'";

                SqlCommand cmd2 = new SqlCommand(s2, con);
                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
        else
        {
        }
    }

    protected void DataList_GalBkl_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        int imgid = (int)DataList_GalBkl.DataKeys[(int)e.Item.ItemIndex];
        cmd.CommandText = "DELETE FROM [image_bkl] WHERE idimg_bkl=" + imgid;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        DataList_GalBkl.EditItemIndex = -1;
        DataList_GalBkl.DataBind();
        Response.Redirect(Request.RawUrl);
    }
    protected void DataList_GalBkl_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (Session["New"] != null)
        {
            string strses = Convert.ToString(Session["New"]);
            if (strses != "admin")
            {
                var delbtn = e.Item.FindControl("DltBtn") as LinkButton;
                delbtn.Visible = false;
            }
        }
    }

    protected void Down_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        if (lk != null)
        {
            Response.AddHeader("Content-disposition", "attachment; filename=" + lk.CommandArgument);
            Response.WriteFile(Server.MapPath("" + lk.CommandArgument.ToString()));
            Response.End();
        }
    }
    protected void GridView_DokBkl_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView_DokBkl.PageIndex = e.NewPageIndex;
        BindGridView_Bkl();
    }
    protected void DownHis_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        if (lk != null)
        {
            Response.AddHeader("Content-disposition", "attachment; filename=" + lk.CommandArgument);
            Response.WriteFile(Server.MapPath("" + lk.CommandArgument.ToString()));
            Response.End();
        }
    }
}