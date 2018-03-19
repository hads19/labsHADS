using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using login;


namespace labsHADS
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowPass_CheckedChanged(object sender, EventArgs e)
        {
            //Funciona regular
            if (showPass.Checked)
            {
                password.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                password.TextMode = TextBoxMode.Password;
            }

        }

        protected void login_Click(object sender, EventArgs e)
        {
            string tipo = Login1.logear(email.Text, password.Text);
            

            if (tipo.Equals("Profesor"))
            {
                Session.Contents.Add("Email", email.Text);
                Response.Redirect("Profesor.aspx");
            }
            else if (tipo.Equals("Alumno"))
            {
                Session.Contents.Add("email", email.Text);
                Response.Redirect("Alumno.aspx");
            }
            else
            {
                Label1.Text = tipo;
            }
        }
    }
}