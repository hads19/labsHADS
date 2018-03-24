<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profesor.aspx.cs" Inherits="labsHADS.Profesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: medium (16 pt);
            font-weight: bold;
        }
        .auto-style2 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
            text-decoration: underline;
        }
    </style>
</head>
<body style="height: 190px; width: 575px;">
    <form id="form1" runat="server">
        <div style="background-color:cadetblue; border-style: solid; border-color: inherit; border-width: medium; width:200px; z-index: 1; left: 10px; top: 15px; position: absolute; height: 185px;">
            <asp:HyperLink ID="Asig" runat="server" style="z-index: 1; left: 20px; top: 10px; position: absolute" Text="Asignaturas" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="Tareas" runat="server" style="z-index: 1; left: 20px; top: 35px; position: absolute" Text="Tareas" CssClass="auto-style2" NavigateUrl="~/TareasProfesor.aspx"></asp:HyperLink>
            <asp:HyperLink ID="Grupos" runat="server" style="z-index: 1; left: 20px; top: 60px; position: absolute" Text="Grupos" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="ImpXML" runat="server" style="z-index: 1; left: 20px; top: 85px; position: absolute" Text="Importar v. XMLDocument" CssClass="auto-style2" NavigateUrl="~/ImportarTareasXMLDocument.aspx"></asp:HyperLink>
            <asp:HyperLink ID="Exp" runat="server" style="z-index: 1; left: 20px; top: 110px; position: absolute" Text="Exportar" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="ImpDataSet" runat="server" style="z-index: 1; left: 20px; top: 135px; position: absolute" Text="Importar v. DataSet" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="VerEstadisticas" runat="server" style="z-index: 1; left: 20px; top: 160px; position: absolute" Text="Ver Estadísticas" CssClass="auto-style2" NavigateUrl="~/VerEstadisticas.aspx"></asp:HyperLink>

        </div>
        <div style="background-color:lightskyblue; border-style: solid; border-color: inherit; border-width: medium; width:347px; z-index: 1; left: 227px; top: 15px; position: absolute; height: 185px;">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1; left: 16px; top: 59px; position: absolute; width: 317px; color: #800080" Text="Gestión Web de Tareas-Dedicación"></asp:Label>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style1" style="z-index: 1; left: 120px; top: 107px; position: absolute" Text="Profesores"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx" style="z-index: 1; left: 258px; top: 157px; position: absolute">Cerrar sesión</asp:HyperLink>
        </div>
    </form>
</body>
</html>
