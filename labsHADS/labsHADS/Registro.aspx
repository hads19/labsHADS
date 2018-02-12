<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="labsHADS.Registro" %>

<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resgistro</title>
    <style>
    </style>
    <script src='https://www.google.com/recaptcha/api.js'></script>
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
                <asp:TableRow>
                    <asp:TableCell>Captcha</asp:TableCell><asp:TableCell>
                        <!-- -->
                        <BotDetect:WebFormsCaptcha ID="captcha" runat="server" ControlToValidate="insertCaptcha" ErrorMessage="Mal" />
                        <asp:TextBox runat="server" ID="insertCaptcha" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Captcha G</asp:TableCell><asp:TableCell>
                        <!-- -->
                        <div class="g-recaptcha" data-sitekey="6Lf91UUUAAAAAM1nvJAD9fGu40jACk3e-lS7N_7o"></div>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
            <asp:Button ID="sendRegister" Text="Enviar" runat="server" OnClick="sendRegister_Click" />
            <br />
            <br />
            <asp:Label ID="avisoMail" runat="server" Text="Registro correcto, se te ha enviado un email para verificar tu cuenta"
                Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
