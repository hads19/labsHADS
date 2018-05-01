using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tareas;
//using labsHADS.ref4;
using labsHADS.net.azurewebsites.wshads;

namespace labsHADS.Coordinador1
{
    public partial class Coordinador : System.Web.UI.Page
   {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Esto quitar
            //AverageAsig av = new AverageAsig();
            //Label3.Text = av.Funciona();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("../Inicio.aspx");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            AverageAsig av = new AverageAsig();
            Label3.Text = Convert.ToString(av.getTiempoMedio(DropDownList1.SelectedValue) / av.getAlumnosTarea(DropDownList1.SelectedValue));
        }
    }
}