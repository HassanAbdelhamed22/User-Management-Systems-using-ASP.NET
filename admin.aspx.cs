using OfficeOpenXml;
using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace Task
{

    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            if (Session["name"] != null)
            {
                lbl_name.Text = Session["name"].ToString();
            }
            else
            {
                lbl_name.Text = "Name not set";
            }

            if(!IsPostBack)
            {
                gv_admin.DataSource = Admin.selectAll();
                gv_admin.DataBind();
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

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if(FileUpload1.HasFile)
            {
                string filePath = Path.GetTempFileName();
                FileUpload1.SaveAs(filePath);

                DataTable dt = ReadExcelFile(filePath);
                SaveToDatabase(dt);

                DataTable dt2 = Admin.selectAll();
                gv_admin.DataSource = dt2;
                gv_admin.DataBind();
            }
        }

        private DataTable ReadExcelFile(string filePath)
        {
            DataTable dt = new DataTable();

            using (ExcelPackage package = new ExcelPackage(new FileInfo(filePath)))
            {
                ExcelWorksheet worksheet = package.Workbook.Worksheets[0];

                for (int col = 1; col <= worksheet.Dimension.End.Column; col++)
                {
                    dt.Columns.Add(worksheet.Cells[1, col].Text);
                }

                for (int row = 2; row <= worksheet.Dimension.End.Row; row++)
                {
                    DataRow dataRow = dt.NewRow();
                    for (int col = 1; col <= worksheet.Dimension.End.Column; col++)
                    {
                        dataRow[col - 1] = worksheet.Cells[row, col].Text;
                    }
                    dt.Rows.Add(dataRow);
                }
            }

            return dt;
        }

        private void ifCrnExist(int crn, string agentName, string reason, string type)
        {
            if(Admin.CrnExists(crn))
            {
                Admin.updateAll(crn, agentName, reason, type);
            }
            else
            {
                Admin.Insert(crn, agentName, reason, type);
            }
        }

        private void SaveToDatabase(DataTable dt)
        {
            foreach (DataRow row in dt.Rows)
            {
                int crn = Convert.ToInt32(row["CRN"]);
                string agentName = row["Agent Name"].ToString();
                string reason = row["Reason"].ToString();
                string branchType = row["Branch Type"].ToString();

                ifCrnExist(crn, agentName, reason, branchType);
            }
        }

        protected void gv_admin_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_admin.EditIndex = e.NewEditIndex;
            gv_admin.DataSource = Admin.selectAll();
            gv_admin.DataBind();
        }

        protected void gv_admin_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string reason = ((TextBox)gv_admin.Rows[e.RowIndex].FindControl("txt_reason")).Text;
            string type = ((TextBox)gv_admin.Rows[e.RowIndex].FindControl("txt_type")).Text;

            int crn = (int)gv_admin.DataKeys[e.RowIndex].Value;
            Admin.update(crn, reason, type);

            gv_admin.EditIndex = -1;
            DataTable dt = Admin.selectAll();
            gv_admin.DataSource = dt;
            gv_admin.DataBind();
        }

        protected void gv_admin_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_admin.EditIndex = -1;
            DataTable dt = Admin.selectAll();
            gv_admin.DataSource = dt;
            gv_admin.DataBind();
        }

        protected void gv_admin_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int crn = (int)gv_admin.DataKeys[e.RowIndex].Value;
            Admin.delete(crn);
            DataTable dt = Admin.selectAll();
            gv_admin.DataSource = dt;
            gv_admin.DataBind();
        }

        protected void btn_deleteAll_Click(object sender, EventArgs e)
        {
            Admin.deleteAll();
            DataTable dt = Admin.selectAll();
            gv_admin.DataSource = dt;
            gv_admin.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        
    }
}
