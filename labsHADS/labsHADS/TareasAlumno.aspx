<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasAlumno.aspx.cs" Inherits="labsHADS.TareasAlumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
        }

        .auto-style2 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: medium;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="border-style: solid; border-color: inherit; border-width: medium; z-index: 1; left: 10px; top: 15px; position: absolute; height: 568px; width: 574px;">
            <div style="background-color: cornflowerblue; width: 533px; height: 70px; z-index: 1; left: 14px; top: 15px; position: absolute;">
                <asp:Label ID="label1" runat="server" CssClass="auto-style2" Style="z-index: 1; left: 228px; top: 10px; position: absolute" Text="ALUMNOS"></asp:Label>
                <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Style="z-index: 1; left: 128px; top: 40px; position: absolute" Text="GESTIÓN DE TAREAS GENÉRICAS"></asp:Label>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 441px; top: 4px; position: absolute; width: 92px">Cerrar Sesión</asp:LinkButton>
            </div>
            <asp:Label ID="Label3" runat="server" CssClass="auto-style1" Style="z-index: 1; left: 17px; top: 90px; position: absolute" Text="Seleccionar asignatura (solo se muestran aquellas en las que está matricudo):"></asp:Label>
            <asp:DropDownList AutoPostBack="true" ID="dropAsignaturas" runat="server" Style="z-index: 1; left: 19px; top: 127px; position: absolute; width: 281px; height: 19px; right: 266px;" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:GridView ID="gridTareas" runat="server" AutoGenerateColumns="False" Style="z-index: 1; left: 17px; top: 171px; position: absolute; height: 237px; width: 526px" OnSelectedIndexChanging="gridTareas_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CommandName="Editar" Text="Instanciar" onclick="Button1_Click" />
                        </ItemTemplate>
                        <HeaderStyle Width="150px" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Codigo" HeaderText="Código" ItemStyle-Width="150px">
                        <HeaderStyle Width="200px" />
                        <ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" ItemStyle-Width="150px">
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="HEstimadas" HeaderText="Horas" ItemStyle-Width="150px">
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="TipoTarea" HeaderText="Tipo" ItemStyle-Width="150px">
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
