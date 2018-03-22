using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using tareas;

namespace labsHADS
{
    public partial class ImportarTareasXMLDocument : System.Web.UI.Page
    {

        XmlDocument xml;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Xml1.DocumentSource = Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml");
            //Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl");


        }

        protected void asignaturasDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                xml = new XmlDocument();

                xml.Load(Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml"));

                Xml1.DocumentSource = Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml");
                Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl");

                errorLabel.Text = "";

            }
            catch (Exception)
            {
                errorLabel.Text = "No hay ningun XML que importar para esa tarea";
            }
            
        }

        protected void importarButton_Click(object sender, EventArgs e)
        {
            IEXml.Importar(asignaturasDDL.SelectedValue);
        }
    }
}