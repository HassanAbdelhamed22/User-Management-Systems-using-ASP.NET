using System;
using System.Data;
using System.Web;

namespace Task
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["sd"] != null)
            {
                string userId = Request.Cookies["sd"].Values["id"];
                string role = Request.Cookies["sd"].Values["role"];
                string name = Request.Cookies["sd"].Values["name"];

                if (!string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(role) && !string.IsNullOrEmpty(name))
                {
                    Session["id"] = userId;
                    Session["role"] = role;
                    Session["name"] = name;

                    if (role == "admin")
                    {
                        Response.Redirect("~/admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/user.aspx");
                    }
                }
            }
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string userName = txt_usename.Text;
            string password = txt_password.Text;

            DataTable dt = Login.select(userName, password);

            if (dt.Rows.Count > 0)
            {
                int userId = Convert.ToInt32(dt.Rows[0]["user_ID"]);
                string role = dt.Rows[0]["role"].ToString();
                string name = dt.Rows[0]["user_name"].ToString();
                Session["id"] = userId;
                Session["role"] = role;
                Session["name"] = name;

                if (ckb_remeber.Checked == true)
                {
                    HttpCookie cookie = new HttpCookie("sd");
                    cookie.Values["id"] = userId.ToString();
                    cookie.Values["role"] = role;
                    cookie.Values["name"] = name;
                    cookie.Expires = DateTime.Now.AddHours(20);
                    Response.Cookies.Add(cookie);
                }

                if (role == "admin")
                {
                    Response.Redirect("~/admin.aspx");
                }
                else
                {
                    Response.Redirect("~/user.aspx");
                }
            }
            else
            {
                lbl_error.Text = "Invalid username or password.";
                lbl_error.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btn_haveAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/registeration.aspx");
        }
    }
}