using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Data;
using System.Xml;
using System.Security.Cryptography;

namespace register
{
    public static class Register
    {
        public const string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";

        public static string SendVerEmail(int num, string email)
        {
            try
            {
                string to = email; //To address    
                string from = "hads19@outlook.es"; //From address    
                MailMessage message = new MailMessage(from, to);

                string mailbody = "Te has registrado correctamente en nuestra página, pero ahora necesitamos que verifiques tu correo para" +
                    " poder acceder a nuestras escasas y deficientes funcionalidades. Por favor, haz click en el enlace a continuación: " +
                    "</br>" +
                    "<a href ='http://labshads19.azurewebsites.net/Confirmar.aspx/?email=" + email + "&num=" + num + "'> CONFIRMAR MAIL </a>" +
                    "</br>" +
                    "</br>" +
                    "Si recibiste este mensaje por error, por favor, eliminalo.";

                message.Subject = "Verifique su email amigo";
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp-mail.outlook.com", 587); //Gmail smtp    
                System.Net.NetworkCredential basicCredential1 = new
                System.Net.NetworkCredential("hads19@outlook.es", "CFB10titan");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                try
                {
                    client.Send(message);
                }
                catch (Exception ex)
                {
                    return ex.ToString();
                }
                return "Registro correcto, te hemos enviado un email para verificar tu cuenta.";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        public static string Registrar(string email, string nombre, string apellidos, int numconfir, string tipo, string pass)
        {
            try
            {
                //Definición de la conexión
                SqlConnection connection = new SqlConnection(connectionString);

                //Comprobamos que el email aún no está registrado
                /*
                connection.Open();

                string checkQuery = "SELECT * FROM Usuarios WHERE email = @email";

                SqlCommand checkSql = new SqlCommand(checkQuery, connection);

                checkSql.Parameters.AddWithValue("@email", email);

                int numRows = (int) checkSql.ExecuteScalar();

                if (numRows == 0)
                {
                    return "El usuario ya existe en la BD";
                }
                else if (numRows > 0)
                {
                    return "El usuario no existe en la BD";
                }

                connection.Close();
                */

                //Insertamos los valores en la BD
                connection.Open();

                string insertQuery = "INSERT INTO Usuarios(email, nombre, apellidos, numconfir, confirmado, tipo, pass) " +
                    "VALUES(@email, @nombre, @apellidos, @numconfir, @confirmado, @tipo, @pass)";

                SqlCommand insertSql = new SqlCommand(insertQuery, connection);

                //Encriptar la contraseña
                MD5 mD5 = MD5.Create();
                byte[] cryptoPass = System.Text.Encoding.ASCII.GetBytes(pass);
                cryptoPass = mD5.ComputeHash(cryptoPass);
                pass = System.Text.Encoding.ASCII.GetString(cryptoPass);

                insertSql.Parameters.AddWithValue("@email", email);
                insertSql.Parameters.AddWithValue("@nombre", nombre);
                insertSql.Parameters.AddWithValue("@apellidos", apellidos);
                insertSql.Parameters.AddWithValue("@numconfir", numconfir);
                insertSql.Parameters.AddWithValue("@confirmado", false);
                insertSql.Parameters.AddWithValue("@tipo", tipo);
                insertSql.Parameters.AddWithValue("@pass", pass);

                insertSql.ExecuteNonQuery();

                connection.Close();

            }
            catch (SqlException e)
            {
                if (e.Number == 2627)
                {
                    if (e.Message.Contains("PRIMARY KEY"))
                    {
                        return "EMAIL";
                    }
                    return e.Message;

                }
                return e.Message;
            }
            catch (Exception e)
            {
                return e.Message;
            }
            return "Funciona";
        }

        public static string Verificar(string email, int codigo)
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);

                connection.Open();

                string checkQuery = "SELECT numConfir FROM Usuarios WHERE email = @email AND numConfir = @num";

                SqlCommand checkSql = new SqlCommand(checkQuery, connection);
                checkSql.Parameters.AddWithValue("@email", email);
                checkSql.Parameters.AddWithValue("@num", codigo);

                var numRows = checkSql.ExecuteScalar();

                if (numRows != null)
                {
                    string updateQuery = "UPDATE Usuarios SET confirmado = 'True' WHERE email = @email";

                    SqlCommand updateSql = new SqlCommand(updateQuery, connection);
                    updateSql.Parameters.AddWithValue("@email", email);

                    updateSql.ExecuteNonQuery();

                    connection.Close();
                    return "Email verificado correctamente, ya puedes iniciar sesión!";
                }
                else
                {
                    connection.Close();
                    return "Código de verificación incorrecto, no toquetees con la URL";
                }
            }
            catch (Exception)
            {
                return "Ha habido un problema";
            }
        }
    }
}
namespace login
{

    public static class Login1
    {
        public const string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";

        public static string logear(string email, string pass)
        {

            try
            {

                string result = "";
                //Definición de la conexión
                SqlConnection connection = new SqlConnection(connectionString);

                //Comprobamos los valores en la BD
                connection.Open();

                string checkQuery = "SELECT * FROM Usuarios WHERE email = @email AND pass = @pass AND confirmado = 'True'";

                SqlCommand checkSql = new SqlCommand(checkQuery, connection);

                //Encriptar la contraseña
                MD5 mD5 = MD5.Create();
                byte[] cryptoPass = System.Text.Encoding.ASCII.GetBytes(pass);
                cryptoPass = mD5.ComputeHash(cryptoPass);
                pass = System.Text.Encoding.ASCII.GetString(cryptoPass);

                checkSql.Parameters.AddWithValue("@email", email);
                checkSql.Parameters.AddWithValue("@pass", pass);

                var numRows = checkSql.ExecuteScalar();

                if (numRows != null)
                {
                    SqlDataReader reader = checkSql.ExecuteReader();

                    if (reader.Read())
                    {
                        string tipo = (string)reader.GetValue(5);
                        if (tipo.Equals("Profesor"))
                        {
                            result = "Profesor";
                        }
                        else
                        {
                            result = "Alumno";
                        }
                    }
                }
                else
                {
                    string verQuery = "SELECT * FROM Usuarios WHERE email = @email AND pass = @pass AND confirmado = 'False'";

                    SqlCommand verSql = new SqlCommand(verQuery, connection);

                    verSql.Parameters.AddWithValue("@email", email);
                    verSql.Parameters.AddWithValue("@pass", pass);

                    numRows = verSql.ExecuteScalar();

                    if (numRows == null)
                    {
                        result = "Email o contraseña incorrecta. Vuelve a intentarlo.";
                    }
                    else
                    {
                        result = "Este email aun no está confirmado";
                    }

                }
                connection.Close();
                return result;
            }
            catch (Exception e)
            {
                return e.Message;
            }



        }
    }
}
namespace cambio
{

    public static class Cambio
    {
        public const string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";

        public static string cambiar1(string email)
        {
            try
            {
                string result = "";

                //Definición de la conexión
                SqlConnection connection = new SqlConnection(connectionString);

                //Comprobamos los valores en la BD
                connection.Open();

                string checkQuery = "SELECT * FROM Usuarios WHERE email = @email AND confirmado = 'True'";

                SqlCommand checkSql = new SqlCommand(checkQuery, connection);

                checkSql.Parameters.AddWithValue("@email", email);

                var numRows = checkSql.ExecuteScalar();



                if (numRows != null)
                {
                    result = "1";
                }
                else
                {
                    string verQuery = "SELECT * FROM Usuarios WHERE email = @email AND confirmado = 'False'";

                    SqlCommand verSql = new SqlCommand(verQuery, connection);

                    verSql.Parameters.AddWithValue("@email", email);

                    numRows = verSql.ExecuteScalar();

                    if (numRows == null)
                    {
                        result = "Este email es incorrcto.";
                    }
                    else
                    {
                        result = "Este email aun no está confirmado";
                    }

                }
                connection.Close();
                return result;
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public static string SendVerClave(int num, string email)
        {
            try
            {
                string to = email; //To address    
                string from = "hads19@outlook.es"; //From address    
                MailMessage message = new MailMessage(from, to);

                string mailbody = "La clave para poder cambiar el password es: " + num;
                message.Subject = "Clave";
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp-mail.outlook.com", 587); //Gmail smtp    
                System.Net.NetworkCredential basicCredential1 = new
                System.Net.NetworkCredential("hads19@outlook.es", "CFB10titan");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                try
                {
                    client.Send(message);
                }
                catch (Exception ex)
                {
                    return ex.ToString();
                }
                return "Clave enviada a su correo.";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        public static string cambiar2(string email, string pass)
        {
            try
            {


                //Definición de la conexión
                SqlConnection connection = new SqlConnection(connectionString);

                //Comprobamos los valores en la BD
                connection.Open();

                string checkQuery = "UPDATE Usuarios SET pass = @pass WHERE email = @email";


                SqlCommand checkSql = new SqlCommand(checkQuery, connection);

                checkSql.Parameters.AddWithValue("@pass", pass);
                checkSql.Parameters.AddWithValue("@email", email);

                checkSql.ExecuteNonQuery();

                connection.Close();
                return "El password se ha cambiado correctamente.";
            }
            catch (Exception e)
            {
                return e.Message;
            }

        }

    }

}
namespace tareas
{

    public static class Tareas
    {
        public const string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";

        public static DataView BuscarTareasGenericas(string email, string asignatura)
        {

            string tareasQuery = "SELECT CodAsig, Codigo, Descripcion, HEstimadas, TipoTarea " +
                    "FROM TareasGenericas " +
                    "WHERE Explotacion = 1 AND Codigo NOT IN (SELECT CodTarea FROM EstudiantesTareas WHERE Email = @email)";

            SqlConnection connection = new SqlConnection(connectionString);

            SqlCommand tareasSql = new SqlCommand(tareasQuery, connection);

            tareasSql.Parameters.AddWithValue("@email", email);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(tareasSql);
            SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(dataAdapter);

            DataTable dt = new DataTable("tTareas");
            DataSet ds = new DataSet("sTareas");

            dataAdapter.Fill(ds, "tTareas");
            dt = ds.Tables["tTareas"];

            DataView dv = new DataView(dt);

            dv.RowFilter = "CodAsig = '" + asignatura + "'";

            return dv;
        }

        public static DataTable BuscarTareasGenericasProfesor(string email, string asignatura)
        {

            string tareasQuery = "SELECT DISTINCT TareasGenericas.Codigo, TareasGenericas.Descripcion, TareasGenericas.HEstimadas, TareasGenericas.Explotacion, TareasGenericas.TipoTarea FROM TareasGenericas INNER JOIN Asignaturas ON Asignaturas.codigo = TareasGenericas.CodAsig INNER JOIN GruposClase ON Asignaturas.codigo = GruposClase.codigoasig INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.codigogrupo = GruposClase.codigo WHERE(ProfesoresGrupo.email = @email) AND(Asignaturas.codigo = @asig)";

            SqlConnection connection = new SqlConnection(connectionString);

            SqlCommand tareasSql = new SqlCommand(tareasQuery, connection);

            tareasSql.Parameters.AddWithValue("@email", email);
            tareasSql.Parameters.AddWithValue("@asig", asignatura);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(tareasSql);
            SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(dataAdapter);

            DataTable dt = new DataTable("tTareas");
            DataSet ds = new DataSet("sTareas");

            dataAdapter.Fill(ds, "tTareas");
            dt = ds.Tables["tTareas"];

            return dt;
        }

        public static DataView CargarAsignaturas(string email)
        {
            string query = "SELECT GruposClase.codigoasig" +
                " FROM GruposClase, EstudiantesGrupo" +
                " WHERE EstudiantesGrupo.Grupo = GruposClase.codigo AND EstudiantesGrupo.email = @email";

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@email", email);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(dataAdapter);

            DataTable dt = new DataTable("tAsignaturas");
            DataSet ds = new DataSet("sAsignaturas");

            dataAdapter.Fill(ds, "tAsignaturas");
            dt = ds.Tables["tAsignaturas"];

            DataView dv = new DataView(dt);

            return dv;
        }

        public static DataView CargarAsignaturasProfesor(string email)
        {
            string query = "SELECT GruposClase.codigoasig FROM GruposClase, ProfesoresGrupo WHERE GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email";


            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@email", email);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(dataAdapter);

            DataTable dt = new DataTable("tAsignaturas");
            DataSet ds = new DataSet("sAsignaturas");

            dataAdapter.Fill(ds, "tAsignaturas");
            dt = ds.Tables["tAsignaturas"];

            DataView dv = new DataView(dt);

            return dv;
        }


        public static DataTable CargarTareasAlumno(string email)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            String query = "SELECT Email, CodTarea, HEstimadas, HReales " +
                "FROM EstudiantesTareas " +
                "WHERE Email = @email";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@email", email);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);

            DataTable dt = new DataTable("tTareas");
            DataSet ds = new DataSet("sTareas");

            dataAdapter.Fill(ds, "tTareas");
            dt = ds.Tables["tTareas"];

            return dt;
        }

        public static DataTable InstanciarTarea(string usuario, string tarea, int estimadas, int reales, DataTable currentTable)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            String query = "INSERT INTO EstudiantesTareas " +
                "VALUES (@email, @CodTarea, @HEstimadas, @HReales)";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@email", usuario);
            command.Parameters.AddWithValue("@CodTarea", tarea);
            command.Parameters.AddWithValue("@HEstimadas", estimadas);
            command.Parameters.AddWithValue("@HReales", reales);

            DataRow dr = currentTable.NewRow();

            dr["Email"] = usuario;
            dr["CodTarea"] = tarea;
            dr["HEstimadas"] = estimadas;
            dr["HReales"] = reales;

            currentTable.Rows.Add(dr);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            dataAdapter.InsertCommand = command;
            dataAdapter.Update(currentTable);

            return currentTable;
        }
    }

    public static class IEXml
    {
        public const string connectionString = "Data Source=tcp:hads19ac.database.windows.net,1433;Initial Catalog = hads19ac; Persist Security Info=True;User ID = hads19; Password=CFB10payaso";


        public static string Importar(string asignatura, XmlDocument xml)
        {
            bool acierto = false;
            bool fallo = false;

            string query = "SELECT * FROM TareasGenericas";
            SqlConnection connection = new SqlConnection(connectionString);

            SqlCommand command = new SqlCommand(query, connection);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dt = new DataTable("tTareas");
            DataSet ds = new DataSet("sTareas");

            dataAdapter.Fill(ds, "tTareas");
            dt = ds.Tables["tTareas"];


            XmlNodeList tareas = xml.GetElementsByTagName("tarea");
            for (int i = 0; i < tareas.Count; i++)
            {

                string insertQuery = "INSERT INTO TareasGenericas " +
                    "VALUES (@Codigo, @Descripcion, @CodAsig, @HEstimadas, @Explotacion, @TipoTarea)";

                SqlCommand insertCommand = new SqlCommand(insertQuery, connection);

                insertCommand.Parameters.AddWithValue("@Codigo", tareas[i].Attributes["codigo"].Value);
                insertCommand.Parameters.AddWithValue("@Descripcion", tareas[i].ChildNodes[0].InnerText);
                insertCommand.Parameters.AddWithValue("@CodAsig", asignatura);
                insertCommand.Parameters.AddWithValue("@HEstimadas", tareas[i].ChildNodes[1].InnerText);
                insertCommand.Parameters.AddWithValue("@Explotacion", tareas[i].ChildNodes[2].InnerText);
                insertCommand.Parameters.AddWithValue("@TipoTarea", tareas[i].ChildNodes[3].InnerText);

                DataRow dr = dt.NewRow();

                dr["Codigo"] = tareas[i].Attributes["codigo"].Value;
                dr["Descripcion"] = tareas[i].ChildNodes[0].InnerText;
                dr["CodAsig"] = asignatura;
                dr["HEstimadas"] = tareas[i].ChildNodes[1].InnerText;
                dr["Explotacion"] = tareas[i].ChildNodes[2].InnerText;
                dr["TipoTarea"] = tareas[i].ChildNodes[3].InnerText;

                dt.Rows.Add(dr);

                dataAdapter.InsertCommand = insertCommand;


                try
                {
                    dataAdapter.Update(dt);
                    acierto = true;
                }
                catch (Exception e)
                {
                    fallo = true;
                    Console.WriteLine(e.Message);
                }

            }
            return "Todas las tareas importadas con exito. Es posible que algunas ya estuvieran importadas.";

        }
    }
}