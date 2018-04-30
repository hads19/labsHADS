<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coordinador.aspx.cs" Inherits="labsHADS.Coordinador1.Coordinador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Seleccionar una asignatura:" style="z-index: 1; left: 100px; top: 75px; position: absolute"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="codigo" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="z-index: 1; left: 300px; top: 75px; position: absolute; width: 258px;"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" SelectCommand="SELECT * FROM [Asignaturas]"></asp:SqlDataSource>
            <asp:Label ID="Label2" runat="server" Text="Tiempo medio de dedicación a la asignatura en horas:" style="z-index: 1; left: 100px; top: 150px; position: absolute"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="" style="z-index: 1; left: 500px; top: 150px; position: absolute"></asp:Label>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 715px; top: 35px; position: absolute">Cerrar Sesion</asp:LinkButton>
        </div>
    </form>
</body>
</html>
