using System.Data;
using System.Data.SqlClient;

namespace Task
{
    public class Registeration
    {
        //insert
        public static int insert(string email, string user_name, string password, int age, string phone)
        {
            SqlCommand cmd = new SqlCommand("insert into User_info (email, user_name, password, age, phone) values(@email, @user_name, @password, @age, @phone)");
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@user_name", user_name);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@age", age);
            cmd.Parameters.AddWithValue("@phone", phone);

            return DBlayer.Dml(cmd);
        }

        public static bool EmailExists(string email)
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM User_info WHERE email = @Email");
            cmd.Parameters.AddWithValue("@Email", email);

            int count = (int)DBlayer.ExecuteScalar(cmd);
            return count > 0;
        }

    }
}