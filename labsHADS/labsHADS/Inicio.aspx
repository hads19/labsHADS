<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication1.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            z-index: 1;
            left: 10px;
            top: 15px;
            position: absolute;
            height: 300px;
            width: 600px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 240px">


            <asp:Label ID="email" runat="server" style="top: 50px; left: 50px; position: absolute; height: 20px; width: 100px; right: 467px;" Text="Email:"></asp:Label>


            <asp:Label ID="password" runat="server" style="top: 80px; left: 50px; position: absolute; height: 19px" Text="Password:" Width="100px"></asp:Label>


            <asp:TextBox ID="emailbox" runat="server" style="top: 40px; left: 150px; position: absolute; height: 22px; width: 128px" OnTextChanged="emailbox_TextChanged"></asp:TextBox>


            <asp:TextBox ID="passwordbox" runat="server" style="top: 70px; left: 150px; position: absolute; height: 22px; width: 128px"></asp:TextBox>


            <asp:Button ID="login" runat="server" style="top: 125px; left: 45px; position: absolute; height: 50px; width: 90px" Text="Login" />


            <asp:HyperLink ID="registrar" runat="server" style="top: 125px; left: 150px; position: absolute; height: 20px; width: 150px">Quiero Regístrarme</asp:HyperLink>


            <asp:HyperLink ID="modificar" runat="server" style="top: 150px; left: 150px; position: absolute; height: 20px; width: 150px; right: 317px;">Modificar Contraseña</asp:HyperLink>


            <asp:RegularExpressionValidator ID="correo" runat="server" ControlToValidate="emailbox" ErrorMessage="Correo Incorrecto" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="top: 40px; left: 300px; position: absolute; height: 19px; width: 150px; right: 150px;" ForeColor="Red"></asp:RegularExpressionValidator>


            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" style="top: 40px; left: 290px; position: absolute; height: 19px; width: 8px" ControlToValidate="emailbox"></asp:RequiredFieldValidator>


            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" style="top: 70px; left: 290px; position: absolute; height: 19px; width: 141px" ControlToValidate="passwordbox" ForeColor="Red"></asp:RequiredFieldValidator>


        </div>
    </form>
</body>
</html>
