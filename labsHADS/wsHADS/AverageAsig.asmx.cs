using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace wsHADS
{
    /// <summary>
    /// Summary description for AverageAsig
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class AverageAsig : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string Funciona()
        {
            return "Funciona bien";
        }

        [WebMethod]
        public double getTiempoMedio(string asignatura)
        {
            string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";
            try
            {
                double result = 0;

                //Definición de la conexión
                SqlConnection connection = new SqlConnection(connectionString);

                //Comprobamos los valores en la BD
                connection.Open();

                string tiempoTotal = "SELECT SUM(EstudiantesTareas.HReales) AS media FROM EstudiantesTareas INNER JOIN TareasGenericas ON TareasGenericas.Codigo=EstudiantesTareas.CodTarea WHERE TareasGenericas.CodAsig= @asignatura";
                SqlCommand checkSql = new SqlCommand(tiempoTotal, connection);
                checkSql.Parameters.AddWithValue("@asignatura", asignatura);

                SqlDataReader reader = checkSql.ExecuteReader();
                reader.Read();
                double tiempo = Convert.ToDouble(reader["media"]);

                connection.Close();

                return tiempo;
            }
            catch (Exception e)
            {
                return 0;
            }
        }

        [WebMethod]
        public double getAlumnosTarea(string asignatura)
        {
            string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";

            try
            {
                double result = 0;

                //Definición de la conexión
                SqlConnection connection = new SqlConnection(connectionString);

                //Comprobamos los valores en la BD
                connection.Open();

                string alumnosPorAsig = "SELECT COUNT(EstudiantesGrupo.Email) AS alumno FROM EstudiantesGrupo INNER JOIN GruposClase ON EstudiantesGrupo.Grupo = GruposClase.codigo WHERE(GruposClase.codigoasig = @asignatura1)";
                SqlCommand checkSql1 = new SqlCommand(alumnosPorAsig, connection);
                checkSql1.Parameters.AddWithValue("@asignatura1", asignatura);

                SqlDataReader reader1 = checkSql1.ExecuteReader();
                reader1.Read();
                double alumno = Convert.ToDouble(reader1["alumno"]);

                connection.Close();

                return alumno;
            }
            catch (Exception e)
            {
                return 0;
            }
        }
    }
}
