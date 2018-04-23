<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumnos.aspx.cs" Inherits="labsHADS.Alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            <asp:HyperLink ID="tarGen" runat="server" style="z-index: 1; left: 21px; top: 20px; position: absolute" Text="Tareas Genéricas" CssClass="auto-style2" NavigateUrl="~/Alumnos/TareasAlumno.aspx"></asp:HyperLink>
            <asp:HyperLink ID="tarPro" runat="server" style="z-index: 1; left: 22px; top: 70px; position: absolute" Text="Tareas Propias" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="grupos" runat="server" style="z-index: 1; left: 20px; top: 120px; position: absolute" Text="Grupos" CssClass="auto-style2"></asp:HyperLink>
        </div>
        <div style="background-color:lightskyblue; border-style: solid; border-color: inherit; border-width: medium; width:347px; z-index: 1; left: 227px; top: 15px; position: absolute; height: 185px;">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1; left: 16px; top: 59px; position: absolute; width: 317px; color: #800080" Text="Gestión Web de Tareas-Dedicación"></asp:Label>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style1" style="z-index: 1; left: 140px; top: 107px; position: absolute" Text="Alumnos"></asp:Label>
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
