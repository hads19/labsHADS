<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="labsHADS.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form" runat="server">
        <div>
            Registro<br />
            <br />
            <asp:Table ID="datos" runat="server">
                <asp:TableRow>
                    <asp:TableCell>Email</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="email"/></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Nombre</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="nombre"/></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
