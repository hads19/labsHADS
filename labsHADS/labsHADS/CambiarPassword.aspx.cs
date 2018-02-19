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

            tclave.Visible = false;
            tpass.Visible = false;
            confirmar.Visible = false;
            cambiar.Visible = false;

        }

        protected void solicitar_Click(object sender, EventArgs e)
        {
            Label30.Text = Cambio.cambiar1(email.Text);

            if (Cambio.cambiar1(email.Text) == "Se le enviara al email un codigo") {
                temail.Enabled = false;
                solicitar.Enabled = false;
                tclave.Visible = true;
                confirmar.Visible = true;

            }

        }

        protected void confirmar_Click(object sender, EventArgs e)
        {
            tclave.Visible = true;
            confirmar.Visible = true;
            confirmar.Enabled = false;
            tclave.Enabled = false;
            tpass.Visible = true;
            cambiar.Visible = true;

        }

        protected void cambiar_Click(object sender, EventArgs e)
        {
            tclave.Visible = true;
            confirmar.Visible = true;
            confirmar.Enabled = false;
            tclave.Enabled = false;
            tpass.Visible = true;
            cambiar.Visible = true;
            Label30.Text = Cambio.cambiar2(email.Text, pass.Text);
            tpass.Enabled = false;
            cambiar.Enabled = false;
        }
    }
}