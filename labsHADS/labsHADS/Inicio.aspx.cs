using System;
using System.Collections;
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

            int numAlum = (int) Application.Contents["numAlumnos"];
            int numProf = (int) Application.Contents["numProfesores"];
            ArrayList al = (ArrayList)Application.Contents["alumnos"];
            ArrayList pr = (ArrayList)Application.Contents["profesores"];

            if (tipo.Equals("Profesor"))
            {
                Session.Contents.Add("tipo", "Profesor");
                Session.Contents.Add("Email", email.Text);
                if (email.Text == "vadillo@ehu.es")
                {
                    System.Web.Security.FormsAuthentication.SetAuthCookie("vadillo", false);
                }
                else
                {
                    System.Web.Security.FormsAuthentication.SetAuthCookie("profesor", false);
                }
                numProf = (int)Application.Contents["numProfesores"] + 1;
                Application.Contents["numProfesores"] = numProf;
                pr.Add(email.Text);
                Application.Contents["profesores"] = pr;
                Response.Redirect("Profesores/Profesor.aspx");
            }
            else if (tipo.Equals("Alumno"))
            {
                Session.Contents.Add("tipo", "Alumno");
                Session.Contents.Add("email", email.Text);
                System.Web.Security.FormsAuthentication.SetAuthCookie("alumno", false);
                numAlum = (int)Application.Contents["numAlumnos"] + 1;
                Application.Contents["numAlumnos"] = numAlum;
                al.Add(email.Text);
                Application.Contents["alumnos"] = al;
                Response.Redirect("Alumnos/Alumno.aspx");
            }
            else if (tipo.Equals("Admin"))
            {
                Session.Contents.Add("email", email.Text);
                System.Web.Security.FormsAuthentication.SetAuthCookie("admin", false);
                Response.Redirect("Admin/VerUsuarios.aspx");
            }
            else if (tipo.Equals("Coordinador"))
            {
                Session.Contents.Add("email", email.Text);
                System.Web.Security.FormsAuthentication.SetAuthCookie("coordinador", false);
                Response.Redirect("Coordinador/Coordinador.aspx");
            }
            else
            {
                Label1.Text = tipo;
            }
        }
    }
}