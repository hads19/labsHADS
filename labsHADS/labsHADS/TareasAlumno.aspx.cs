using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tareas;

namespace labsHADS
{
    public partial class TareasAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                DataView dv = Tareas.BuscarTareasGenericas("pepe@ikasle.ehu.es");

                gridTareas.DataSource = dv;
                gridTareas.DataBind();
            }
        }
    }
}