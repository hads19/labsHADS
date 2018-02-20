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
            string email = Request.QueryString["email"];
            int codigo = Convert.ToInt16(Request.QueryString["num"]);

            Label1.Text = Register.Verificar(email, codigo);
        }
    }
}