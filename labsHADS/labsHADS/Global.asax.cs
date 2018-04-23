using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.ApplicationServices;
using System.Collections;

namespace labsHADS
{
    public class Global : System.Web.HttpApplication
    {
        ArrayList al = new ArrayList();
        ArrayList pr = new ArrayList();

        protected void Application_Start(object sender, EventArgs e)
        {
            Application.Contents["numAlumnos"] = 0;
            Application.Contents["numProfesores"] = 0;
            Application.Contents["alumnos"] = al;
            Application.Contents["profesores"] = pr;

            ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
                new ScriptResourceDefinition
                {
                    Path = "/Scripts/jquery-3.3.1.min.js",
                    DebugPath = "/Scripts/jquery-3.3.1.js",
                    CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js",
                    CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.js"
                });

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            int numAlum = (int)Application.Contents["numAlumnos"];
            int numProf = (int)Application.Contents["numProfesores"];
            ArrayList al = (ArrayList)Application.Contents["alumnos"];
            ArrayList pr = (ArrayList)Application.Contents["profesores"];

            if ((string)Session.Contents["tipo"] == "Alumno")
            {
                al.Remove(Session.Contents["email"]);
                numAlum = (int)Application.Contents["numAlumnos"] - 1;
            }
            else
            {
                pr.Remove(Session.Contents["email"]);
                numProf = (int)Application.Contents["numProfesores"] - 1;
            }

            Application.Contents["numAlumnos"] = numAlum;
            Application.Contents["numProfesores"] = numProf;
            Application.Contents["alumnos"] = al;
            Application.Contents["profesores"] = pr;

            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}