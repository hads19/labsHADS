using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cambio;

namespace labsHADS
{
    public partial class CambiarPassword : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void solicitar_Click(object sender, EventArgs e)
        {

            if (Cambio.cambiar1(email.Text) == "1")
            {
                temail.Enabled = false;
                solicitar.Enabled = false;

                int randNum = new Random().Next(100000, 999999);
                Session.Contents.Add("randNum", randNum);
                Label30.Text = Cambio.SendVerClave(randNum, email.Text);

                tclave.Visible = true;
                confirmar.Visible = true;
            }
            else
            {
                Label30.Text = Cambio.cambiar1(email.Text);
            }

        }


        protected void confirmar_Click(object sender, EventArgs e)
        {

            try
            {
                if (int.Parse(clave.Text) == (int)Session.Contents["randNum"])
                {
                    tclave.Enabled = false;
                    confirmar.Enabled = false;
                    tpass.Visible = true;
                    cambiar.Visible = true;
                    Label30.Text = "Inserte los passwords.";
                }
            }
            catch (Exception ex)
            {
                Label30.Text = "Clave incorrecta. Vuelve a intentarlo.";
            }

        }

        protected void cambiar_Click(object sender, EventArgs e)
        {
            tpass.Enabled = false;
            cambiar.Enabled = false;
            Label30.Text = Cambio.cambiar2(email.Text, pass.Text);
        }
    }
}