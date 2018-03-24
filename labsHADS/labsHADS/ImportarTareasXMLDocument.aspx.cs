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

        protected void Page_Load(object sender, EventArgs e)
        {
            importarButton.Enabled = false;


            if (!IsPostBack)
            {
                asignaturasDDL.SelectedIndex = 0;
                asignaturasDDL_SelectedIndexChanged(asignaturasDDL, null); 
            }

        }

        protected void asignaturasDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            resultInfoLabel.Text = "";

            try
            {
                XmlDocument xml = new XmlDocument();

                xml.Load(Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml"));

                Xml1.DocumentSource = Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml");
                Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl");

                errorLabel.Text = "";
                importarButton.Enabled = true;

            }
            catch (Exception)
            {
                errorLabel.Text = "No hay ningun XML que importar para esa tarea";
                importarButton.Enabled = false;
            }
            
        }

        protected void importarButton_Click(object sender, EventArgs e)
        {
            XmlDocument xml = new XmlDocument();

            xml.Load(Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml"));

            resultInfoLabel.Text = IEXml.Importar(asignaturasDDL.SelectedValue, xml);

            Xml1.DocumentSource = Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml");
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl");
        }
    }
}