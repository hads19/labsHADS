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
        public static void Main()
        {
            Prueba();
        }

        public static bool SendVerEmail(int num, string email)
        {
            try
            {

                SmtpClient client = new SmtpClient();
                client.Port = 587;
                client.Host = "smtp-mail.outlook.com";
                client.EnableSsl = true;
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("hads19@outlook.es", "CFB10titan");

                MailMessage mm = new MailMessage("hads19@outlook.es", email, "Verifique su cuenta", "Su número de verificación es " + num);
                mm.BodyEncoding = UTF8Encoding.UTF8;
                mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

                client.Send(mm);


                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static string Prueba()
        {
            try
            {
                SqlConnection connection = new SqlConnection(
                    "Server=tcp:hads19ac.database.windows.net,1433;" +
                    "Initial Catalog=hads19ac;" +
                    "Persist Security Info=False;" +
                    "User ID=hads19;" +
                    "Password=XXX;" + //CAMBIAR LA CONTRASEÑA
                    "MultipleActiveResultSets=False;Encrypt=True;" +
                    "TrustServerCertificate=False;Connection Timeout=30;");

                connection.Open();
                connection.Close();

            } catch (Exception e)
            {
                return e.Message;
            }
                return "Funciona";
        }
    }
}
