﻿using System;
using System.Collections.Generic;
using System.Linq;
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

        protected void sendRegister_Click(object sender, EventArgs e)
        {
            avisoMail.Visible = true;

            int randNum = new Random().Next(500);

            bool r = register.Register.sendVerEmail(randNum, email.Text);

            avisoMail.Text = r.ToString();
        }
    }
}