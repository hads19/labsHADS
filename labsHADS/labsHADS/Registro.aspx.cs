using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace labsHADS
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendRegister_Click(object sender, EventArgs e)
        {
            if (!ValidateCaptcha())
            {
                avisoMail.Text = "Captcha incorrecto, vuelve a intentarlo.";
                avisoMail.Visible = true;
                return;
            }

            avisoMail.Text = "Registro correcto, se te ha enviado un email para verificar tu cuenta.";
            avisoMail.Visible = true;
            int randNum = new Random().Next(500);

            //bool r = register.Register.sendVerEmail(randNum, email.Text);

            //avisoMail.Text = r.ToString();
        }

        //Valida los captchas
        protected bool ValidateCaptcha()
        {
            //Captcha de letras
            bool isHuman = captcha.Validate(insertCaptcha.Text);
            insertCaptcha.Text = null;
            if (!isHuman)
            {
                return false;
            }

            //Captcha de Google
            string errorMessage = string.Empty;
            bool isValidCaptcha = ValidateReCaptcha(ref errorMessage);
            if (!isValidCaptcha)
            {
                return false;
            }

            return true;
        }

        public bool ValidateReCaptcha(ref string errorMessage)
        {
            var gresponse = Request["g-recaptcha-response"];
            string secret = "6LdgU0YUAAAAADcLCefwPHUQPUrfghwLPVHUn-uv";
            string ipAddress = GetIpAddress();

            var client = new WebClient();

            string url = string.Format(
                "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}&remoteip={2}",
                secret, gresponse, ipAddress);


            var response = client.DownloadString(url);

            var captchaResponse = JsonConvert.DeserializeObject<ReCaptchaResponse>(response);

            if (captchaResponse.Success)
            {
                return true;
            }
            else
            {
                var error = captchaResponse.ErrorCodes[0].ToLower();
                switch (error)
                {
                    case ("missing-input-secret"):
                        errorMessage = "The secret key parameter is missing.";
                        break;
                    case ("invalid-input-secret"):
                        errorMessage = "The given secret key parameter is invalid.";
                        break;
                    case ("missing-input-response"):
                        errorMessage = "The g-recaptcha-response parameter is missing.";
                        break;
                    case ("invalid-input-response"):
                        errorMessage = "The given g-recaptcha-response parameter is invalid.";
                        break;
                    default:
                        errorMessage = "reCAPTCHA Error. Please try again!";
                        break;
                }

                return false;
            }
        }

        string GetIpAddress()
        {
            var ipAddress = string.Empty;

            if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            {
                ipAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            }
            else if (!string.IsNullOrEmpty(Request.UserHostAddress))
            {
                ipAddress = Request.UserHostAddress;
            }

            return ipAddress;
        }

        public class ReCaptchaResponse
        {
            [JsonProperty("success")]
            public bool Success { get; set; }

            [JsonProperty("error-codes")]
            public List<string> ErrorCodes { get; set; }
        }
    }
}