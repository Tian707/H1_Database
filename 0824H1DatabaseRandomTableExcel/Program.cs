using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Data;
using System.Data.SqlClient;


namespace _0824H1DatabaseRandomTableExcel
{
    internal class Program
    {
        
        static void Main(string[] args)
        {
            //string path = CreateCSVFile();
            ImportCSVToSQL();
            Console.ReadLine();
        }

        #region View

        #endregion

        #region Controller

        // Import data from .csv file to SQL
        private static void ImportCSVToSQL()
        {
            // Create csv file and return filepath
            // ? If CreateCSVFile() is called in the Main method (outside this method),
            // the string of path cannot be used inside this method in the string of insertQuery
            // tried to create an empty static string outside methods, but doesn't help

            string path = CreateCSVFile();

            // Establish connection
            string connectionString = @"Data Source=ZBC-S-tian0247\SQLEXPRESS;Initial Catalog=Performance;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            // Bulk insert
            string tableName = "Randoms";
            string insertQuery = $@"
                BULK INSERT {tableName}
                FROM '{path}'
                WITH (
                FIELDTERMINATOR = ';',
                ROWTERMINATOR = '{Environment.NewLine}',
                FIRSTROW = 2
                )";

            using (SqlTransaction trasaction = conn.BeginTransaction())
            {
                using (SqlCommand command = new SqlCommand(insertQuery, conn, trasaction))
                {
                    command.ExecuteNonQuery();
                }
                trasaction.Commit();
            }
            Console.WriteLine("Data inserted.");
        }


        // Write data into .csv file

        private static string CreateCSVFile()
        {
            using (StreamWriter writer = new StreamWriter("Randoms.csv"))
            {
                writer.WriteLine("Index;Randoms");

                for (int i = 0; i < randomNum.GetLength(0); i++)
                {
                    writer.Write($"{randomNum[i, 0]};{randomNum[i, 1]}");
                    writer.WriteLine();
                }
            }
            Console.WriteLine("CSV FILE created.");

            string path = Path.GetFullPath("Randoms.csv");
            //Console.WriteLine(path);
            return path;
        }

        static int[,] randomNum = RandomNumbers(1000000);
        private static void PrintData()
        {
            int colNr = randomNum.GetLength(1);
            int rowNr = randomNum.GetLength(0);

            for (int i = 0; i < rowNr; i++)
            {
                for (int j = 0; j < colNr; j++)
                {
                    Console.Write(randomNum[i, j] + "\t");
                }
                //Console.Write("\n");
            }
        }
        #endregion


        #region Modul

        // Generate 1M random numbers mellem 0 and 9999
        private static int[,] RandomNumbers(int rowCount)
        {
            int[,] randomNum = new int[rowCount, 2];

            Random rand = new Random();

            for (int i = 0; i < rowCount; i++)
            {
                randomNum[i, 0] = i + 1;
                randomNum[i, 1] = rand.Next(0, 10000);
            }
            return randomNum;
        }
        #endregion
    }
}
