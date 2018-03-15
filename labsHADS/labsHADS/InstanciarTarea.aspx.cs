using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace labsHADS
{
    public partial class InstanciarTarea : System.Web.UI.Page
    {
        public const string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";

        protected void Page_Load(object sender, EventArgs e)
        {
            //String email = Request.QueryString["email"];

            SqlConnection connection = new SqlConnection(connectionString);

            String query = "SELECT Email, CodTarea, HEstimadas, HReales " +
                "FROM EstudiantesTareas " +
                "WHERE Email = @email";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@email", /*Session.Contents["email"]*/ "pepe@ikasle.ehu.es");

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);

            DataTable dt = new DataTable("tTareas");
            DataSet ds = new DataSet("sTareas");

            dataAdapter.Fill(ds, "tTareas");
            dt = ds.Tables["tTareas"];

            DataView dv = new DataView(dt);
            gridTareas.DataSource = dv;
            gridTareas.DataBind();
        }

        protected void crearTarea_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            String query = "INSERT INTO EstudianteTareas " +
                "VALUES (@email, @CodTarea, @HEstimadas, @HReales)";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@email", usuario.Text);
            command.Parameters.AddWithValue("@CodTarea", tarea.Text);
            command.Parameters.AddWithValue("@HEstimadas", Convert.ToInt32(estimadas.Text));
            command.Parameters.AddWithValue("@HReales", Convert.ToInt32(reales.Text));

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            dataAdapter.InsertCommand = command;
            dataAdapter.InsertCommand.ExecuteNonQuery();
        }
    }
}