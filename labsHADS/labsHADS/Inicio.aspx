<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="labsHADS.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio</title>
    <style type="text/css">
        #form1 {
            z-index: 1;
            left: 10px;
            top: 15px;
            position: absolute;
            height: 300px;
            width: 600px;
        }

        #Inicio {
            z-index: 1;
            left: 10px;
            top: 15px;
            position: absolute;
            height: 240px;
            width: 617px;
        }
    </style>
</head>
<body>
    <form id="Inicio" runat="server">
        <div style="height: 240px">

            <asp:Table ID="datos" runat="server" Style="z-index: 1; left: 50px; top: 50px; position: absolute; height: 54px; width: 413px">
                <asp:TableRow>
                    <asp:TableCell>Email</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="erroremail" runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Contraseña</asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="password" TextMode="Password"/>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="errorpass" runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell></asp:TableCell><asp:TableCell>
                        Show Password
                        <asp:CheckBox ID="showPass" runat="server" OnCheckedChanged="ShowPass_CheckedChanged" AutoPostBack="true" />
                    </asp:TableCell><asp:TableCell>
                    </asp:TableCell></asp:TableRow></asp:Table><asp:Button ID="login" runat="server" Text="Login" Style="top: 153px; left: 50px; position: absolute; height: 26px; width: 56px;" OnClick="login_Click" /><br />
            <asp:Table ID="Table2" runat="server" Style="z-index: 1; left: 119px; top: 134px; position: absolute; height: 61px; width: 155px;"><asp:TableRow>
                    <asp:TableCell>
                        <asp:HyperLink ID="registro" runat="server" NavigateUrl="~/Registro.aspx">Quiero Regístrarme</asp:HyperLink>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:HyperLink ID="modificar" runat="server" NavigateUrl="~/CambiarPassword.aspx">Modificar Contraseña</asp:HyperLink>
                    </asp:TableCell></asp:TableRow></asp:Table><asp:Label ID="Label1" runat="server" style="z-index: 1; left: 57px; top: 258px; position: absolute"></asp:Label></div></form></body></html>