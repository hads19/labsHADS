<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="labsHADS.Registro" %>

<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resgistro</title>
    <style>
        #form {
            height: 436px;
        }
    </style>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body style="height: 452px">

    <form id="form" runat="server">
        <div style="height: 439px">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:Table ID="datos" runat="server" Style="top: 45px; left: 50px; position: absolute; height: 172px; width: 828px; right: 79px">
                <asp:TableRow>

                    <asp:TableCell>Email</asp:TableCell>
                    <asp:TableCell>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:TextBox runat="server" ID="email" OnTextChanged="email_TextChanged" AutoPostBack="true" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio"
                                    ControlToValidate="email" ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server"
                                    ErrorMessage="*Formato inválido"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="email" ForeColor="Red">
                                </asp:RegularExpressionValidator>
                                <asp:Label ID="validaMail" runat="server" Text=""></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:TableCell>

                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Nombre</asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="name" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="name" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Apellidos</asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="surname" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio"
                            ControlToValidate="surname" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Contraseña</asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="password" TextMode="Password" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio"
                            ControlToValidate="password" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Confirmar contraseña</asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="repeatPassword" TextMode="Password" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio"
                            ControlToValidate="repeatPassword" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="compareValidator" runat="server" ErrorMessage="*Las contraseñas no coinciden"
                            ControlToCompare="password" ControlToValidate="repeatPassword" ForeColor="Red">
                        </asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Rol</asp:TableCell><asp:TableCell>
                        <asp:RadioButtonList ID="rol" runat="server">
                            <asp:ListItem Value="Alumno" Selected="True">Alumno</asp:ListItem>
                            <asp:ListItem Value="Profesor" Selected="False">Profesor</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Captcha</asp:TableCell><asp:TableCell>
                        <!-- -->
                        <BotDetect:WebFormsCaptcha ID="captcha" runat="server" ControlToValidate="insertCaptcha" ErrorMessage="Mal" ForeColor="Red" />
                        <asp:TextBox runat="server" ID="insertCaptcha" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Captcha G</asp:TableCell><asp:TableCell>
                        <!-- -->
                        <div class="g-recaptcha" data-sitekey="6LdgU0YUAAAAAO5xCSIJnnW5Ar1wbIgRP5gsR42T"></div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                    <asp:Button ID="sendRegister" Text="Enviar" runat="server" OnClick="SendRegister_Click" Style="top: 408px; left: 49px; position: absolute; height: 26px; width: 53px" />

            <br />
            <br />
            <asp:Label ID="avisoMail" runat="server" Text="Registro correcto, se te ha enviado un email para verificar tu cuenta."
                Visible="False" Style="top: 412px; left: 220px; position: absolute; height: 19px; width: 580px"></asp:Label>
            <asp:HyperLink ID="inicio" runat="server" NavigateUrl="~/Inicio.aspx" Style="z-index: 1; left: 326px; top: 455px; position: absolute">Volver al inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
