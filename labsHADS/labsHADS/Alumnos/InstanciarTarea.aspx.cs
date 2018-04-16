using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using tareas;

namespace labsHADS
{
    public partial class InstanciarTarea : System.Web.UI.Page
    {
        public const string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";
        public DataTable currentTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Cargar el grindview

            currentTable = Tareas.CargarTareasAlumno(Convert.ToString(Session.Contents["email"]));
            DataView dv = new DataView(currentTable);

            gridTareas.DataSource = dv;
            gridTareas.DataBind();

            //Rellenar los campos bloqueados

            usuario.Text = Convert.ToString(Session.Contents["email"]);
            tarea.Text = Request.QueryString["codigo"];
            estimadas.Text = Request.QueryString["estimadas"];
        }

        protected void crearTarea_Click(object sender, EventArgs e)
        {
            currentTable = Tareas.InstanciarTarea(usuario.Text, tarea.Text, Convert.ToInt32(estimadas.Text), Convert.ToInt32(reales.Text), currentTable);
            gridTareas.DataBind();
            crearTarea.Enabled = false;
        }
    }
}