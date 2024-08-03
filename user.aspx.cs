using System;
using System.Data;
using System.Web;

namespace Task
{
    public partial class user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                lbl_name.Text = Session["name"].ToString();
            }
            else
            {
                lbl_name.Text = "Name not set";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["id"] = null;
            HttpCookie coo = new HttpCookie("sd");
            coo.Expires = DateTime.Now.AddDays(-5);
            Response.Cookies.Add(coo);

            Response.Redirect("~/login.aspx");
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            int searchText;
            if (int.TryParse(txt_search.Text, out searchText))
            {
                DataTable dt = Admin.selectByCrn(searchText);

                if (dt.Rows.Count > 0)
                {
                    gv_admin.DataSource = dt;
                    gv_admin.DataBind();
                    lbl_error.Text = ""; 
                }
                else
                {
                    lbl_error.Text = "No records found for the given CRN.";
                    lbl_error.ForeColor = System.Drawing.Color.Red;
                    gv_admin.DataSource = null; 
                    gv_admin.DataBind(); 
                }
            }
            else
            {
                lbl_error.Text = "Please enter a valid CRN (Numbers only).";
                lbl_error.ForeColor = System.Drawing.Color.Red;
                gv_admin.DataSource = null; 
                gv_admin.DataBind();
            }
        }
    }
}