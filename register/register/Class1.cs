using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;

namespace register
{
    public static class Register
    {
        public const string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";

        public static string SendVerEmail(int num, string email)
        {
            try
            {
                string to = email; //To address    
                string from = "hads19@outlook.es"; //From address    
                MailMessage message = new MailMessage(from, to);

                string mailbody = "Te has registrado correctamente en nuestra página, pero ahora necesitamos que verifiques tu correo para" +
                    " poder acceder a nuestras escasas y deficientes funcionalidades. Por favor, haz click en el enlace a continuación: " +
                    "</br>" +
                    "www.youtube.com/alexelcapo/?email=" + email + "&num=" + num +
                    "</br>" +
                    "</br>" +
                    "Si recibiste este mensaje por error, por favor, eliminalo inmediatamente y jamas hables a nadie sobre el." +
                    " Recuerda, conocemos tu email.";

                message.Subject = "Verifique su email amigo";
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp-mail.outlook.com", 587); //Gmail smtp    
                System.Net.NetworkCredential basicCredential1 = new
                System.Net.NetworkCredential("hads19@outlook.es", "CFB10titan");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                try
                {
                    client.Send(message);
                }
                catch (Exception ex)
                {
                    return ex.ToString();
                }
                return "Registro correcto, te hemos enviado un email para verificar tu cuenta.";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        public static string Registrar(string email, string nombre, string apellidos, int numconfir, string tipo, string pass)
        {
            try
            {
                //Definición de la conexión
                SqlConnection connection = new SqlConnection(connectionString);

                //Comprobamos que el email aún no está registrado
                /*
                connection.Open();

                string checkQuery = "SELECT * FROM Usuarios WHERE email = @email";

                SqlCommand checkSql = new SqlCommand(checkQuery, connection);

                checkSql.Parameters.AddWithValue("@email", email);

                int numRows = (int) checkSql.ExecuteScalar();

                if (numRows == 0)
                {
                    return "El usuario ya existe en la BD";
                }
                else if (numRows > 0)
                {
                    return "El usuario no existe en la BD";
                }

                connection.Close();
                */

                //Insertamos los valores en la BD
                connection.Open();

                string insertQuery = "INSERT INTO Usuarios(email, nombre, apellidos, numconfir, confirmado, tipo, pass) " +
                    "VALUES(@email, @nombre, @apellidos, @numconfir, @confirmado, @tipo, @pass)";

                SqlCommand insertSql = new SqlCommand(insertQuery, connection);

                insertSql.Parameters.AddWithValue("@email", email);
                insertSql.Parameters.AddWithValue("@nombre", nombre);
                insertSql.Parameters.AddWithValue("@apellidos", apellidos);
                insertSql.Parameters.AddWithValue("@numconfir", numconfir);
                insertSql.Parameters.AddWithValue("@confirmado", false);
                insertSql.Parameters.AddWithValue("@tipo", tipo);
                insertSql.Parameters.AddWithValue("@pass", pass);

                insertSql.ExecuteNonQuery();

                connection.Close();

            }
            catch (SqlException e)
            {
                if (e.Number == 2627)
                {
                    if (e.Message.Contains("PRIMARY KEY"))
                    {
                        return "Este émail ya está registrado, utiliza otro.";
                    }
                    return e.Message;

                }
                return e.Message;
            }
            catch (Exception e)
            {
                return e.Message;
            }
            return "Funciona";
        }
    }
}
