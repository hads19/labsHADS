using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;

namespace register
{
    public static class Register
    {
        public static bool sendVerEmail(int num, string email)
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
    }
}
