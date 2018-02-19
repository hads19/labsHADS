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
            Label1.Text = Login1.logear(email.Text, password.Text);
            
        }
    }
}