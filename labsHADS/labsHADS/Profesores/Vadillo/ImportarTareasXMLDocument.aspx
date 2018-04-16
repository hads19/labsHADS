<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportarTareasXMLDocument.aspx.cs" Inherits="labsHADS.ImportarTareasXMLDocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            z-index: 1;
            left: 10px;
            top: 15px;
            position: absolute;
            height: 521px;
            width: 753px;
            right: 510px;
        }

        .auto-style1 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
        }
        .auto-style2 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="border-style: solid; border-color: inherit; border-width: medium; z-index: 1; left: 0px; top: 0px; position: absolute; height: 519px; width: 756px; ">
            <div style="z-index: 1; left: 91px; top: 27px; position: absolute; height: 72px; width: 574px; background-color: aqua">

                <asp:Label ID="Label1" runat="server" Style="z-index: 1; left: 186px; top: 40px; position: absolute; font-size: medium; font-family: Verdana, Geneva, Tahoma, sans-serif; height: 18px; right: 154px" Text="Importar Tareas Genérias"></asp:Label>
                <asp:Label ID="Label2" runat="server" Style="z-index: 1; left: 262px; top: 12px; position: absolute; font-size: medium; font-family: Verdana, Geneva, Tahoma, sans-serif; height: 17px" Text="Profesor"></asp:Label>

            </div>
            <asp:Label ID="Label3" runat="server" Style="z-index: 1; left: 39px; top: 128px; position: absolute; font-size: small; font-family: Verdana, Geneva, Tahoma, sans-serif;" Text="Seleccionar Asignatura a Importar"></asp:Label>
            <asp:DropDownList AutoPostBack="true" ID="asignaturasDDL" runat="server" Style="z-index: 1; left: 43px; top: 159px; position: absolute; height: 20px; width: 224px" DataSourceID="SqlDataSource2" DataTextField="codigoasig" DataValueField="codigoasig" OnSelectedIndexChanged="asignaturasDDL_SelectedIndexChanged" CssClass="auto-style1">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo WHERE (ProfesoresGrupo.email = @email)">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="importarButton" runat="server" Style="z-index: 1; left: 48px; top: 245px; position: absolute; height: 29px; width: 155px; right: 445px" Text="Importar (XMLD)" CssClass="auto-style1" OnClick="importarButton_Click" />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 524px; top: 67px; position: absolute; width: 139px">Cerrar Sesión</asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

            <asp:Label ID="Label4" runat="server" CssClass="auto-style2" style="z-index: 1; left: 347px; top: 142px; position: absolute; font-size: small; right: 305px" Text="Ordenar Por:"></asp:Label>

            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesores/Profesor.aspx" style="z-index: 1; left: 34px; top: 385px; position: absolute">Volver al menu</asp:HyperLink>

            <asp:Label ID="resultInfoLabel" runat="server" Style="z-index: 1; left: 330px; top: 443px; position: absolute; font-size: small; font-family: Verdana, Geneva, Tahoma, sans-serif; height: 47px; width: 358px" Text="Label"></asp:Label>
            <div style="z-index: 1; left: 305px; top: 191px; position: absolute; height: 234px; width: 425px; overflow:scroll">
                <asp:Panel ID="Panel1" runat="server" Height="188px" Width="395px">
                    <asp:Xml ID="Xml1" runat="server"></asp:Xml>
                    <asp:Label ID="errorLabel" runat="server" CssClass="auto-style1" Style="color: red; z-index: 1; left: 159px; top: 109px; position: absolute"></asp:Label>
                </asp:Panel>
            </div>
            <asp:DropDownList AutoPostBack="true" ID="ordenDDL" runat="server" CssClass="auto-style2" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="z-index: 1; left: 471px; top: 137px; position: absolute">
                <asp:ListItem Value="codigo">Código</asp:ListItem>
                <asp:ListItem Value="descripcion">Descripción</asp:ListItem>
                <asp:ListItem Value="HEstimadas">Horas estimadas</asp:ListItem>
            </asp:DropDownList>
        </div>
    </form>
</body>
</html>
