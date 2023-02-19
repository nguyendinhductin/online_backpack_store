using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace websitebackpack
{
    public class dataservices
    {
        string con = @"Data Source=localhost;Initial Catalog=webbalo;Integrated Security=True";
        //đẩy bảng sql lên datatable bảng tạm
        public DataTable getData(string sql)
        {
            SqlDataAdapter mysqldata = new SqlDataAdapter(sql, con);
            DataTable mydt = new DataTable();
            mysqldata.Fill(mydt);
            return mydt;
        }
        //chạy câu lệnh sql
        public void runquery(string sql)
        {
            SqlConnection mycon = new SqlConnection(con);
            mycon.Open();
            SqlCommand mysql = new SqlCommand(sql, mycon);
            mysql.ExecuteNonQuery();
            mycon.Close();
        }
        public void Update(DataTable myDataTable)
        {
            SqlDataAdapter myDataAdapter = new SqlDataAdapter();
            try
            {
                myDataAdapter.Update(myDataTable);
            }
            catch (SqlException ex)
            {
                Console.Write(ex.Message, "Error " + ex.Number.ToString());
            }
        }
    }
}