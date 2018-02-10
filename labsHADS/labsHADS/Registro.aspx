<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="labsHADS.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resgistro</title>
    <style>
    </style>
</head>
<body>
    <form id="form" runat="server">
        <div>
            <asp:Table ID="datos" runat="server">
                <asp:TableRow>
                    <asp:TableCell>Email</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="email" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio"
                            ControlToValidate="email">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" 
                            ErrorMessage="*Formato inválido"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ControlToValidate="email">
                        </asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Nombre</asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="name" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="name">
                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Apellidos</asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="surname" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio"
                            ControlToValidate="surname">
                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Contraseña</asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="password" TextMode="Password" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio"
                            ControlToValidate="password">
                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Confirmar contraseña</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="repeatPassword" TextMode="Password" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio"
                            ControlToValidate="repeatPassword">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="compareValidator" runat="server" ErrorMessage="*Las contraseñas no coinciden"
                            ControlToCompare="password" ControlToValidate="repeatPassword">
                        </asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Rol</asp:TableCell><asp:TableCell>
                        <asp:RadioButtonList ID="rol" runat="server">
                            <asp:ListItem Value="alumno" Selected="True">Alumno</asp:ListItem>
                            <asp:ListItem Value="profesor" Selected="False">Profesor</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="sendRegister" Text="Enviar" runat="server" OnClick="sendRegister_Click" />
        </div>
    </form>
</body>
</html>
