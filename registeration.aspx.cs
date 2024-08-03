using System;
using System.Web.UI;

namespace Task
{
    public partial class registeration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            string email = txt_email.Text;

            if (Registeration.EmailExists(email))
            {
                lbl_msg.Text = "Email already exists.";
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                lbl_msg.Visible = true;
            }
            else
            {
                Registeration.insert(email, txt_name.Text, txt_password.Text, int.Parse(txt_age.Text), txt_phone.Text);
                lbl_msg.Text = "Registration successful.";
                lbl_msg.CssClass = "py-3 mb-3";
                lbl_msg.Visible = true;
                Response.Redirect("~/login.aspx");
            }
        }


        protected void btn_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }
    }
}