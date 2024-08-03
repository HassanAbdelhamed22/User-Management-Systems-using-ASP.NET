using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;

namespace Task
{
    public class Admin
    {
        //select all
        public static DataTable selectAll()
        { 
            SqlCommand cmd = new SqlCommand("select * from Empolyee_details");

            return DBlayer.Select(cmd);
        }

        //select by id
        public static DataTable selectByCrn(int crn)
        {
            SqlCommand cmd = new SqlCommand("select * from Empolyee_details where CRN=@crn");
            cmd.Parameters.AddWithValue("@crn", crn);

            return DBlayer.Select(cmd);
        }

        //select reason and type
        public static DataTable selectToEdit()
        {
            SqlCommand cmd = new SqlCommand("SELECT Reason, Branch_type FROM Empolyee_details");
            //cmd.Parameters.AddWithValue("@crn", crn);
            //cmd.Parameters.AddWithValue("@reason", reason);
            //cmd.Parameters.AddWithValue("@type", type);

            return DBlayer.Select(cmd);
        }


        //update
        public static int update(int crn, string reason, string type)
        {
            SqlCommand cmd = new SqlCommand("update Empolyee_details set Reason=@reason, Branch_type=@type where CRN=@crn");
            cmd.Parameters.AddWithValue("@reason", reason);
            cmd.Parameters.AddWithValue("@type", type);
            cmd.Parameters.AddWithValue("@crn", crn);

            return DBlayer.Dml(cmd);
        }

        //update all
        public static int updateAll(int crn, string Agent_Name,string reason, string type)
        {
            SqlCommand cmd = new SqlCommand("update Empolyee_details set Agent_Name=@name, Reason=@reason, Branch_type=@type where CRN=@crn");
            cmd.Parameters.AddWithValue("@reason", reason);
            cmd.Parameters.AddWithValue("@type", type);
            cmd.Parameters.AddWithValue("@crn", crn);
            cmd.Parameters.AddWithValue("@name", Agent_Name);

            return DBlayer.Dml(cmd);
        }

        // CRN exist
        public static bool CrnExists(int crn)
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Empolyee_details WHERE CRN = @crn");
            cmd.Parameters.AddWithValue("@crn", crn);
            return (int)DBlayer.ExecuteScalar(cmd) > 0;
        }

        //delete
        public static int delete(int crn)
        {
            SqlCommand cmd = new SqlCommand("delete from Empolyee_details where CRN=@crn");
            cmd.Parameters.AddWithValue("@crn", crn);

            return DBlayer.Dml(cmd);
        }

        //insert
        public static int Insert(int crn, string agentName, string reason, string branchType)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Empolyee_details (CRN, Agent_Name, Reason, Branch_type) VALUES (@CRN, @AgentName, @Reason, @BranchType)");
            cmd.Parameters.AddWithValue("@CRN", crn);
            cmd.Parameters.AddWithValue("@AgentName", agentName);
            cmd.Parameters.AddWithValue("@Reason", reason);
            cmd.Parameters.AddWithValue("@BranchType", branchType);

            return DBlayer.Dml(cmd);
        }

        //delete all
        public static int deleteAll()
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Empolyee_details");

            return DBlayer.Dml(cmd);
        }
    }
}