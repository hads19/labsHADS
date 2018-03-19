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
            string email = Convert.ToString(Session.Contents["email"]);

            if (!Page.IsPostBack)
            {
                //CARGAR EL DROPDOWNLIST
                DataView aDV = Tareas.CargarAsignaturas(email);
                
                dropAsignaturas.DataSource = aDV;
                dropAsignaturas.DataTextField = "codigoasig";
                dropAsignaturas.DataValueField = "codigoasig";
                dropAsignaturas.DataBind();

                try
                {
                    dropAsignaturas.SelectedValue = dropAsignaturas.Items[0].Value;

                    //CARGAR EL GRINDVIEW SIN FILTROS
                    DataView dv = Tareas.BuscarTareasGenericas(email, dropAsignaturas.SelectedValue);

                    gridTareas.DataSource = dv;
                    gridTareas.DataBind();
                }
                catch(Exception ex)
                {

                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                //CARGAR EL GRINDVIEW CON UN FILTRO
                DataView dv = Tareas.BuscarTareasGenericas(Convert.ToString(Session.Contents["email"]), dropAsignaturas.SelectedValue);

                gridTareas.DataSource = dv;
                gridTareas.DataBind();
            }
        }

        protected void gridTareas_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            String codigo = gvr.Cells[1].Text;
            String estimadas = gvr.Cells[3].Text;

            Response.Redirect("InstanciarTarea.aspx?codigo=" + codigo + "&estimadas=" + estimadas);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Inicio.aspx");
        }
    }
}