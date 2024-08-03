using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Task
{
    public class DBlayer
    {
        public static DataTable Select(SqlCommand cmd)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);

            SqlCommand cmm = cmd;
            cmm.Connection = con;

            SqlDataAdapter adapter = new SqlDataAdapter(cmm);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }

        public static int Dml(SqlCommand cmd) 
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            cmd.Connection = con;
            con.Open();

            int roweffect = cmd.ExecuteNonQuery();

            con.Close();

            return roweffect;



        }

        public static object ExecuteScalar(SqlCommand cmd)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            cmd.Connection = con;
            con.Open();

            object result = cmd.ExecuteScalar();

            con.Close();

            return result;
        }
    }
}