using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace labsHADS
{
    public partial class InsertarTarea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                SqlDataSource2.Insert();
                Label8.Text = "Tarea insertada correctamente";
                Button1.Enabled = false;
            }
            catch (Exception ex)
            {
                Label8.Text = "Código repetido.";
            }
        }
    }
}