using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task
{
    public partial class updateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["name"] != null)
            {
                lbl_name.Text = Session["name"].ToString();
            }
            else
            {
                lbl_name.Text = "Name not set";
            }

            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    int userId = Convert.ToInt32(Session["id"]);
                    txt_email.Text = UpdateProfile.selectEmail(userId).Rows.Count > 0
                                     ? UpdateProfile.selectEmail(userId).Rows[0]["email"].ToString()
                                     : string.Empty;

                    txt_name.Text = UpdateProfile.selectName(userId).Rows.Count > 0
                                     ? UpdateProfile.selectName(userId).Rows[0]["user_name"].ToString()
                                     : string.Empty;

                    txt_age.Text = UpdateProfile.selectAge(userId).Rows.Count > 0
                                     ? UpdateProfile.selectAge(userId).Rows[0]["age"].ToString()
                                     : string.Empty;

                    txt_phone.Text = UpdateProfile.selectPhone(userId).Rows.Count > 0
                                     ? UpdateProfile.selectPhone(userId).Rows[0]["phone"].ToString()
                                     : string.Empty;
                }

                lbl_msg.Visible = false;
                lbl_passMsg.Visible = false;
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                int userId = Convert.ToInt32(Session["id"]);
                string email = txt_email.Text;
                string userName = txt_name.Text;
                int age = Convert.ToInt32(txt_age.Text);
                string phone = txt_phone.Text;

                int result = UpdateProfile.update(userId, email, userName, age, phone);

                lbl_msg.Visible = true;

                if (result > 0)
                {
                    lbl_msg.Text = "Profile updated successfully.";
                    lbl_msg.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbl_msg.Text = "Profile update failed.";
                    lbl_msg.ForeColor = System.Drawing.Color.Red;
                }

            }
        }

        protected void lbtn_logout_Click(object sender, EventArgs e)
        {
            Session["id"] = null;
            HttpCookie coo = new HttpCookie("sd");
            coo.Expires = DateTime.Now.AddDays(-5);
            Response.Cookies.Add(coo);

            Response.Redirect("~/login.aspx");
        }

        protected void btn_password_Click(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                int userId = Convert.ToInt32(Session["id"]);
                string oldPass = txt_oldPass.Text;
                string newPass = txt_newPass.Text;

                string currentPass = UpdateProfile.selectPassword(userId).Rows.Count > 0
                                     ? UpdateProfile.selectPassword(userId).Rows[0]["password"].ToString()
                                     : string.Empty; ;

                lbl_passMsg.Visible = true;

                if (currentPass == oldPass)
                {
                    int result = UpdateProfile.updatePass(userId, newPass);
                    if (result > 0)
                    {
                        lbl_passMsg.Text = "Password updated successfully.";
                        lbl_passMsg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lbl_passMsg.Text = "Password update failed.";
                        lbl_passMsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lbl_passMsg.Text = "Old password is incorrect.";
                    lbl_passMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}