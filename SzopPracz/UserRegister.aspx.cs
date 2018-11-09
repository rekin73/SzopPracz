using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace SzopPracz
{
    
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Console.WriteLine("Załadowanie tego");
        }
        private MySqlConnection connect()
        {
            string myconnection =
               "SERVER=localhost;" +
               "DATABASE=szoppracz;" +
               "UID=root;" +
               "PASSWORD=;"+
               "SslMode=none;";

            MySqlConnection connection = new MySqlConnection(myconnection);

            try
            {

                connection.Open();
                Console.WriteLine("Connected");
                return connection;

            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Console.WriteLine("Error"+ex.ErrorCode);
            }
            return null;
        }
        public int insert(string login,string password)
        {
            if(login == "" || password == "")
            {
                lInfo.Text = "Wystąpił błąd pola nie mogą buc puste";
                return -1;
            }
            MySqlConnection conn = connect();
            if (conn == null) return - 1;
            MySqlCommand command = conn.CreateCommand();
            try
            {
                command.CommandText = $"INSERT INTO users (user,password) VALUES ('{login}','{password}')";
                System.Diagnostics.Debug.WriteLine(command.CommandText);
                command.ExecuteNonQuery();
                conn.Close();
            }
            catch(MySql.Data.MySqlClient.MySqlException ex)
            {
                lInfo.Text = $"Wystąpił błąd danych:{ex}";
            }
            return 1;
        }
        protected void bRSubmit_Click(object sender, EventArgs e)
        {
            insert(txRLogin.Text, txRPassword.Text);
        }

        protected void CustomValUserEgsists_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                MySqlConnection conn = connect();
                MySqlCommand command = conn.CreateCommand();
                if (conn == null) lInfo.Text = "Brak połączenia";
                command.CommandText = $"SELECT user FROM users WHERE user = '{args.Value}'";
                MySqlDataReader reader = command.ExecuteReader();
                System.Diagnostics.Debug.WriteLine(reader.Read());
                conn.Close();
                if (!reader.HasRows)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            catch(MySql.Data.MySqlClient.MySqlException ex)
            {
                lInfo.Text = $"Wystąpił błąd danych:{ex}";
            }
        }
    }
}