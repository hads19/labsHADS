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
        <div style="background-color:cadetblue; border-style: solid; border-color: inherit; border-width: medium; width:200px; z-index: 1; left: 11px; top: 14px; position: absolute; height: 185px;">
            <asp:HyperLink ID="Asig" runat="server" style="z-index: 1; left: 20px; top: 10px; position: absolute" Text="Asignaturas" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="Tareas" runat="server" style="z-index: 1; left: 20px; top: 35px; position: absolute" Text="Tareas" CssClass="auto-style2" NavigateUrl="~/Profesores/TareasProfesor.aspx"></asp:HyperLink>
            <asp:HyperLink ID="Grupos" runat="server" style="z-index: 1; left: 20px; top: 60px; position: absolute" Text="Grupos" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="ImpXML" runat="server" style="z-index: 1; left: 20px; top: 85px; position: absolute" Text="Importar v. XMLDocument" CssClass="auto-style2" NavigateUrl="~/Profesores/Vadillo/ImportarTareasXMLDocument.aspx"></asp:HyperLink>
            <asp:HyperLink ID="Exp" runat="server" style="z-index: 1; left: 20px; top: 110px; position: absolute" Text="Exportar" CssClass="auto-style2" NavigateUrl="~/Profesores/Vadillo/ExportarTareas.aspx"></asp:HyperLink>
            <asp:HyperLink ID="ImpDataSet" runat="server" style="z-index: 1; left: 20px; top: 135px; position: absolute" Text="Importar v. DataSet" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="VerEstadisticas" runat="server" style="z-index: 1; left: 20px; top: 160px; position: absolute" Text="Ver Estadísticas" CssClass="auto-style2" NavigateUrl="~/Profesores/VerEstadisticas.aspx"></asp:HyperLink>

        </div>
        <div style="background-color:lightskyblue; border-style: solid; border-color: inherit; border-width: medium; width:347px; z-index: 1; left: 227px; top: 15px; position: absolute; height: 185px;">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1; left: 16px; top: 59px; position: absolute; width: 317px; color: #800080" Text="Gestión Web de Tareas-Dedicación"></asp:Label>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style1" style="z-index: 1; left: 120px; top: 107px; position: absolute" Text="Profesores"></asp:Label>
        </div>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 446px; top: 173px; position: absolute; width: 139px">Cerrar Sesión</asp:LinkButton>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:Label ID="Label4" runat="server"  style="z-index: 1; left: 50px; top: 250px; position: absolute; width: 317px; color: #000000"></asp:Label>
                <asp:Label ID="Label5" runat="server"  style="z-index: 1; left: 50px; top: 300px; position: absolute; width: 131px; color: #000000" Text="Alumnos"></asp:Label>
                <asp:ListBox ID="ListBox1" runat="server" style="z-index: 1; left: 50px; top: 350px; position: absolute"></asp:ListBox>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Label ID="Label6" runat="server"  style="z-index: 1; left: 300px; top: 300px; position: absolute; width: 317px; color: #000000" Text="Profesores"></asp:Label>
                <asp:ListBox ID="ListBox2" runat="server" style="z-index: 1; left: 300px; top: 350px; position: absolute"></asp:ListBox>
                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick1"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
