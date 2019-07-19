using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Budget
{
    public class CRUDBudget
    {
        public int Create(Object.Budget budget)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddBudgetItem_tblBudget", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ItemId", budget.ItemId);
                cmd.Parameters.AddWithValue("@DescriptionForItem", budget.DescriptionForItem);
                cmd.Parameters.AddWithValue("@Amount", budget.Amount);
                cmd.Parameters.AddWithValue("@OnDate", budget.OnDate);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable ReadFull(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,ItemId,Item,Operation,Payment,DescriptionForItem,Amount,OnDate From vwBudgetFull_tblBudget", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Item"] = rdr["Item"];
                        row["ItemId"] = rdr["ItemId"];
                        row["Operation"] = rdr["Operation"];
                        row["Payment"] = rdr["Payment"];
                        row["DescriptionForItem"] = rdr["DescriptionForItem"];
                        row["Amount"] = rdr["Amount"];
                        row["OnDate"] = rdr["OnDate"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public int Update(Object.Budget budget)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateBudgetItem_tblBudget", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", budget.Id);
                cmd.Parameters.AddWithValue("@ItemId", budget.ItemId);
                cmd.Parameters.AddWithValue("@DescriptionForItem", budget.DescriptionForItem);
                cmd.Parameters.AddWithValue("@Amount", budget.Amount);
                cmd.Parameters.AddWithValue("@OnDate", budget.OnDate);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Budget budget)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblBudget Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", budget.Id);

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }
}
