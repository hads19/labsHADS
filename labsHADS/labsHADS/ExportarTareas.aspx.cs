using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using tareas;
using System.Xml;
using Newtonsoft.Json;
using System.IO;

namespace labsHADS
{
    public partial class ExportarTareas : System.Web.UI.Page
    {
        DataTable currentTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Convert.ToString(Session.Contents["Email"]);
            Label4.Visible = false;
            Label5.Visible = false;

            if (!Page.IsPostBack)
            {
                //CARGAR EL DROPDOWNLIST
                DataView aDV = Tareas.CargarAsignaturasProfesor(email);
                
                dropAsignaturas.DataSource = aDV;
                dropAsignaturas.DataTextField = "codigoasig";
                dropAsignaturas.DataValueField = "codigoasig";
                dropAsignaturas.DataBind();

                try
                {
                    dropAsignaturas.SelectedValue = dropAsignaturas.Items[0].Value;

                    //CARGAR EL GRINDVIEW SIN FILTROS
                    DataTable dt = Tareas.BuscarTareasGenericasProfesor(Convert.ToString(Session.Contents["Email"]), dropAsignaturas.SelectedValue);
                    gridTareas.DataSource = dt;
                    gridTareas.DataBind();
                    currentTable = dt;
                    Session.Contents.Add("currentTable", currentTable);
                }
                catch(Exception ex)
                {

                }
            } else
            {
                currentTable = (DataTable) Session.Contents["currentTable"];
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                //CARGAR EL GRINDVIEW CON UN FILTRO
                DataTable dt = Tareas.BuscarTareasGenericasProfesor(Convert.ToString(Session.Contents["Email"]), dropAsignaturas.SelectedValue);
                gridTareas.DataSource = dt;
                gridTareas.DataBind();
            }
        }

        protected void gridTareas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt = Tareas.BuscarTareasGenericasProfesor(Convert.ToString(Session.Contents["Email"]), dropAsignaturas.SelectedValue).Copy();
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            ds.DataSetName = "tareas";
            dt.TableName = "tarea";

            DataColumn dc = dt.Columns[0];
            dc.ColumnMapping = MappingType.Attribute;

            dt.Columns[0].ColumnName = "codigo";
            dt.Columns[1].ColumnName = "descripcion";
            dt.Columns[2].ColumnName = "hestimadas";
            dt.Columns[3].ColumnName = "explotacion";
            dt.Columns[4].ColumnName = "tipotarea";

            dt.WriteXml(Server.MapPath("App_Data/" + dropAsignaturas.SelectedValue + ".xml"));

            XmlDocument xd = new XmlDocument();
            xd.Load(Server.MapPath("App_Data/" + dropAsignaturas.SelectedValue + ".xml"));

            XmlNode tareas = xd.DocumentElement;

            XmlAttribute at = xd.CreateAttribute("xmlns:has");

            XmlText xt;
            xt = xd.CreateTextNode("http://ji.ehu.es/has");
            at.AppendChild(xt);
            tareas.Attributes.Append(at);
            xd.Save(Server.MapPath("App_Data/" + dropAsignaturas.SelectedValue + ".xml"));
            Label5.Text = dropAsignaturas.SelectedValue + ".xml";
            Label4.Visible = true;
            Label5.Visible = true;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Inicio.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            List<Dictionary<String, String>> salidaJSON = new List<Dictionary<string, string>>();

            foreach(DataRow fila in currentTable.Rows)
            {
                Dictionary<String, String> objetos = new Dictionary<string, string>();
                objetos.Add("codigo", fila["Codigo"] as String);
                objetos.Add("descripcion", fila["Descripcion"] as String);
                objetos.Add("hestimadas", Convert.ToInt32(fila["HEstimadas"]).ToString());
                objetos.Add("explotacion", Convert.ToString(Convert.ToBoolean(fila["Explotacion"])));
                objetos.Add("tipotarea", fila["TipoTarea"] as String);

                salidaJSON.Add(objetos);
            }

            String salida = JsonConvert.SerializeObject(salidaJSON, Newtonsoft.Json.Formatting.Indented);
            File.WriteAllText(Server.MapPath("App_Data/" + dropAsignaturas.SelectedValue + ".json"), salida);
            Label5.Text = dropAsignaturas.SelectedValue + ".json";
            Label4.Visible = true;
            Label5.Visible = true;
        }
    }
}