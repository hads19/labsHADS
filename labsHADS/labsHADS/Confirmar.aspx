<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmar.aspx.cs" Inherits="labsHADS.Confirmar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Confirmación</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="top: 50px; left: 50px; position: absolute; height: 19px; width: 1526px">
                El registro se ha realizado correctamente, ya puedes iniciar sesion con tu cuenta.<br />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </p>
            <asp:HyperLink ID="inicio" runat="server" NavigateUrl="~/Inicio.aspx" Style="top: 87px; left: 447px; position: absolute; height: 19px; width: 120px">Volver al inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
