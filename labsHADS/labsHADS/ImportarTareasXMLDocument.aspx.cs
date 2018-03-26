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

                ordenDDL.SelectedIndex = 0;
                DropDownList1_SelectedIndexChanged(ordenDDL, null);
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

                if (IsPostBack)
                {
                    errorLabel.Text = "No hay ningun XML que importar para esa tarea";
                    importarButton.Enabled = false;
                }
            }

            ordenDDL.SelectedIndex = 0;
            DropDownList1_SelectedIndexChanged(ordenDDL, null);
        }

        protected void importarButton_Click(object sender, EventArgs e)
        {
            XmlDocument xml = new XmlDocument();

            xml.Load(Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml"));

            resultInfoLabel.Text = IEXml.Importar(asignaturasDDL.SelectedValue, xml);

            Xml1.DocumentSource = Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml");
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string xsltOrden = "XSLTFile";

            switch (ordenDDL.SelectedValue)
            {
                case "codigo":
                    xsltOrden = "XSLTFileCodigo";
                    break;
                case "descripcion":
                    xsltOrden = "XSLTFileDescripcion";
                    break;
                case "HEstimadas":
                    xsltOrden = "XSLTFileHEstimadas";
                    break;
            }

            try
            {
                XmlDocument xml = new XmlDocument();

                xml.Load(Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml"));

                Xml1.DocumentSource = Server.MapPath("App_Data/" + asignaturasDDL.SelectedValue + ".xml");
                Xml1.TransformSource = Server.MapPath("App_Data/" + xsltOrden + ".xsl");

                errorLabel.Text = "";
                importarButton.Enabled = true;

            }
            catch (Exception)
            {
                if (IsPostBack)
                {
                    errorLabel.Text = "No hay ningun XML que importar para esa tarea";
                    importarButton.Enabled = false;
                }
            }
        }
    }
}