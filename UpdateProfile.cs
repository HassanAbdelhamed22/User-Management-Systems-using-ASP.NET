using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Task
{
    public class UpdateProfile
    {
        public static DataTable selectEmail(int id)
        {
            SqlCommand cmd = new SqlCommand("select email from User_info where user_ID=@id");
            cmd.Parameters.AddWithValue("@id", id);

            return DBlayer.Select(cmd);
        }

        public static DataTable selectName(int id)
        {
            SqlCommand cmd = new SqlCommand("select user_name from User_info where user_ID=@id");
            cmd.Parameters.AddWithValue("@id", id);

            return DBlayer.Select(cmd);
        }

        public static DataTable selectAge(int id)
        {
            SqlCommand cmd = new SqlCommand("select age from User_info where user_ID=@id");
            cmd.Parameters.AddWithValue("@id", id);

            return DBlayer.Select(cmd);
        }

        public static DataTable selectPhone(int id)
        {
            SqlCommand cmd = new SqlCommand("select phone from User_info where user_ID=@id");
            cmd.Parameters.AddWithValue("@id", id);

            return DBlayer.Select(cmd);
        }

        public static DataTable selectPassword(int id)
        {
            SqlCommand cmd = new SqlCommand("select password from User_info where user_ID=@id");
            cmd.Parameters.AddWithValue("@id", id);

            return DBlayer.Select(cmd);
        }
        public static int update(int id, string email,string userName, int age, string phone)
        {
            SqlCommand cmd = new SqlCommand("update User_info set email=@email, user_name=@userName, age=@age, phone=@phone where user_ID=@id");
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@userName", userName);
            cmd.Parameters.AddWithValue("@age", age);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@id", id);

            return DBlayer.Dml(cmd);
        }

        public static int updatePass(int id, string pass)
        {
            SqlCommand cmd = new SqlCommand("update User_info set password=@pass where user_ID=@id");
            cmd.Parameters.AddWithValue("@pass", pass);            
            cmd.Parameters.AddWithValue("@id", id);

            return DBlayer.Dml(cmd);
        }
    }
}