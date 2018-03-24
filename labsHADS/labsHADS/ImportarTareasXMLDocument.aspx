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
            height: 459px;
            width: 753px;
            right: 55px;
        }
        .auto-style1 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 462px; width: 756px; border:solid; ">
            <div style="z-index: 1; left: 91px; top: 27px; position: absolute; height: 72px; width: 574px; background-color:aqua">

                <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 186px; top: 40px; position: absolute; font-size: medium; font-family: Verdana, Geneva, Tahoma, sans-serif; height: 18px; right: 154px" Text="Importar Tareas Genérias"></asp:Label>
                <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 262px; top: 12px; position: absolute; font-size: medium; font-family: Verdana, Geneva, Tahoma, sans-serif; height: 17px" Text="Profesor"></asp:Label>

            </div>
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 39px; top: 128px; position: absolute; font-size: small; font-family: Verdana, Geneva, Tahoma, sans-serif;" Text="Seleccionar Asignatura a Importar"></asp:Label>
            <asp:DropDownList AutoPostBack="true" ID="asignaturasDDL" runat="server" style="z-index: 1; left: 43px; top: 159px; position: absolute; height: 20px; width: 224px" DataSourceID="SqlDataSource2" DataTextField="codigoasig" DataValueField="codigoasig" OnSelectedIndexChanged="asignaturasDDL_SelectedIndexChanged" CssClass="auto-style1">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo WHERE (ProfesoresGrupo.email = @email)">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="importarButton" runat="server" style="z-index: 1; left: 48px; top: 245px; position: absolute; height: 29px; width: 155px; right: 445px" Text="Importar (XMLD)" CssClass="auto-style1" OnClick="importarButton_Click" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor.aspx" style="z-index: 1; left: 47px; top: 369px; position: absolute; font-size: small; font-family: Verdana, Geneva, Tahoma, sans-serif;">Menu Profesor</asp:HyperLink>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            
            <asp:Label ID="resultInfoLabel" runat="server" style="z-index: 1; left: 330px; top: 375px; position: absolute; font-size: small; font-family: Verdana, Geneva, Tahoma, sans-serif; height: 47px; width: 358px" Text="Label"></asp:Label>
            
            <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 331px; top: 135px; position: absolute; height: 186px; width: 354px">
            <asp:Xml ID="Xml1" runat="server"></asp:Xml>
            </asp:Panel>
            <asp:Label ID="errorLabel" runat="server" style="color:red; z-index: 1; left: 337px; top: 258px; position: absolute" CssClass="auto-style1"></asp:Label>
        </div>
    </form>
</body>
</html>
