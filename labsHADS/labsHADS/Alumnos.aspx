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
            <asp:HyperLink ID="tarGen" runat="server" style="z-index: 1; left: 21px; top: 20px; position: absolute" Text="Tareas Genéricas" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="tarPro" runat="server" style="z-index: 1; left: 22px; top: 70px; position: absolute" Text="Tareas Propias" CssClass="auto-style2"></asp:HyperLink>
            <asp:HyperLink ID="grupos" runat="server" style="z-index: 1; left: 20px; top: 120px; position: absolute" Text="Grupos" CssClass="auto-style2"></asp:HyperLink>
        </div>
        <div style="background-color:lightskyblue; border-style: solid; border-color: inherit; border-width: medium; width:347px; z-index: 1; left: 227px; top: 15px; position: absolute; height: 185px;">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1; left: 16px; top: 59px; position: absolute; width: 317px; color: #800080" Text="Gestión Web de Tareas-Dedicación"></asp:Label>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style1" style="z-index: 1; left: 140px; top: 107px; position: absolute" Text="Alumnos"></asp:Label>
        </div>
    </form>
</body>
</html>
