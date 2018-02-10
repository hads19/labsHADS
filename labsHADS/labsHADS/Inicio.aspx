<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="labsHADS.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio</title>
    <style type="text/css">
        #inicio {
            height: 268px;
        }
    </style>
</head>
<body>
    <form id="inicio" runat="server">
        <div style="height: 200px">


            <asp:Table ID="datos" runat="server">
                <asp:TableRow>
                    <asp:TableCell>Email</asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="email" runat="server"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:RequiredFieldValidator ID="erremailvacio" runat="server" ErrorMessage="*" ControlToValidate="email"></asp:RequiredFieldValidator></asp:TableCell>
                    <asp:TableCell>
                        <asp:RegularExpressionValidator ID="erremail" runat="server" ErrorMessage="Correo formato incorrecto" ControlToValidate="email"></asp:RegularExpressionValidator></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Password</asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:RequiredFieldValidator ID="errpassvacio" runat="server" ErrorMessage="*" ControlToValidate="password"></asp:RequiredFieldValidator></asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Button ID="login" runat="server" Text="Login" style="top: 83px; left: 26px; position: absolute; height: 26px; width: 47px" />

            <asp:Table ID="añadido" runat="server" style="top: 76px; left: 88px; position: absolute; height: 25px; width: 260px">
                <asp:TableRow>
                    <asp:TableCell><asp:HyperLink ID="registrar" runat="server" NavigateUrl="~/Registro.aspx">Quiero Registrarme </asp:HyperLink></asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell><asp:HyperLink ID="modificar" runat="server">Modificar Contraseña</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <br />

        </div>
    </form>
</body>
</html>
