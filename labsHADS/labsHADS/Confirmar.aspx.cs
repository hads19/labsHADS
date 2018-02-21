using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using register;

namespace labsHADS
{
    public partial class Confirmar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["email"]) && !String.IsNullOrEmpty(Request.QueryString["num"]))
            {
                string email = Request.QueryString["email"];
                int codigo = Convert.ToInt32(Request.QueryString["num"]);

                Label1.Text = Register.Verificar(email, codigo);
            }
            else
            {
                Label1.Text = "Vaya, ha habido un error.";
            }
        }
    }
}