<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarPassword.aspx.cs" Inherits="labsHADS.CambiarPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<form id="form1" runat="server">
        <div style="height: 285px">
            <asp:Table ID="temail" runat="server" style="top: 30px; left: 70px; position: absolute; height: 28px; width: 344px">
                <asp:TableRow>
                    <asp:TableCell>
                        Introducir Email
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="erremail" runat="server" ErrorMessage="*" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Button ID="solicitar" runat="server" Text="Solicitar Cambiar Contraseña" style="top: 64px; left: 70px; position: absolute; height: 26px; width: 300px" />

            <asp:Table ID="tclave" runat="server" style="top: 109px; left: 70px; position: absolute; height: 28px; width: 344px; right: 1049px;" Enabled="False">
                <asp:TableRow>
                    <asp:TableCell>
                        Introducir Clave
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="clave" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="clave" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Button ID="confirmar" runat="server" Text="Confirmar Clave" style="top: 150px; left: 70px; position: absolute; height: 26px; width: 300px" Enabled="False" />

            <asp:Table ID="tpass" runat="server" style="z-index: 1; left: 70px; top: 188px; position: absolute; height: 54px; width: 468px" Enabled="False">
                <asp:TableRow>
                    <asp:TableCell>
                        Introducir contraseña
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="errpass1" runat="server" ErrorMessage="*" ControlToValidate="pass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Repetir contraseña
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="pass2" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="errpass2" runat="server" ErrorMessage="*" ControlToValidate="pass2" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CompareValidator ID="errepetido" runat="server" ErrorMessage="No coinciden" ControlToCompare="pass" ControlToValidate="pass2" ForeColor="Red"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Button ID="cambiar" runat="server" Text="Cambiar Contraseña" style="top: 277px; left: 70px; position: absolute; height: 26px; width: 300px" Enabled="False" />

            <asp:HyperLink ID="inicio" runat="server" style="top: 283px; left: 447px; position: absolute; height: 19px; width: 116px" NavigateUrl="~/Inicio.aspx">Volver al inicio</asp:HyperLink>

        </div>
    </form>
</body>
</html>
