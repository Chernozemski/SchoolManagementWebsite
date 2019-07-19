using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Budget
{
    public class CRUDBudgetType
    {
        public int Create(Object.BudgetType budgetType)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddBudgetType_tblBudgetType", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Item", budgetType.Item);
                cmd.Parameters.AddWithValue("@OperationTypeId", budgetType.OperationTypeId);
                cmd.Parameters.AddWithValue("@OperationLengthId", budgetType.OperationLengthId);

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
                SqlCommand cmd = new SqlCommand("Select Id,Item,OperationTypeId,OperationType,OperationLengthId,OperationLength From vwBudgetTypeFull_tblBudgetType", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Item"] = rdr["Item"];
                        row["OperationTypeId"] = rdr["OperationTypeId"];
                        row["OperationType"] = rdr["OperationType"];
                        row["OperationLengthId"] = rdr["OperationLengthId"];
                        row["OperationLength"] = rdr["OperationLength"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadWithId(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,Item From tblBudgetType", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Item"] = rdr["Item"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public int Update(Object.BudgetType budgetType)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateBudgetType_tblBudgetType", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", budgetType.Id);
                cmd.Parameters.AddWithValue("@Item", budgetType.Item);
                cmd.Parameters.AddWithValue("@OperationTypeId", budgetType.OperationTypeId);
                cmd.Parameters.AddWithValue("@OperationLengthId", budgetType.OperationLengthId);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.BudgetType budgetType)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblBudgetType Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", budgetType.Id);

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }
}
