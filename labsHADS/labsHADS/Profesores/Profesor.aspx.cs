using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace labsHADS
{
    public partial class Profesor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("../Inicio.aspx");
        }

        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            Label4.Text = "Numero de alumnos: " + Convert.ToString(Application.Contents["numAlumnos"]) + ", Numero de profesores: " + Convert.ToString(Application.Contents["numProfesores"]);

            ListBox1.Items.Clear();
            ListBox1.DataSource = Application.Contents["alumnos"];
            ListBox1.DataBind();

            ListBox2.Items.Clear();
            ListBox2.DataSource = Application.Contents["profesores"];
            ListBox2.DataBind();
        }
    }
}