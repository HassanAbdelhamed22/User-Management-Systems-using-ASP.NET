using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Task
{
    public class Login
    {
        //select
        public static DataTable select(string user_name, string password)
        {
            SqlCommand cmd = new SqlCommand("SELECT user_ID, role, user_name FROM User_info WHERE user_name = @user_name AND password = @password");
            cmd.Parameters.AddWithValue("@user_name", user_name);
            cmd.Parameters.AddWithValue("@password", password);

            return DBlayer.Select(cmd);
        }
    }
}