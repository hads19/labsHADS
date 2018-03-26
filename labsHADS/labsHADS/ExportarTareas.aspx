<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportarTareas.aspx.cs" Inherits="labsHADS.ExportarTareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
        <div style="border-style: solid; border-color: inherit; border-width: medium; z-index: 1; left: 10px; top: 15px; position: absolute; height: 568px; width: 751px;">
            <div style="background-color: cornflowerblue; width: 533px; height: 70px; z-index: 1; left: 70px; top: 15px; position: absolute;">
                <asp:Label ID="label1" runat="server" CssClass="auto-style2" Style="z-index: 1; left: 228px; top: 10px; position: absolute" Text="PROFESOR"></asp:Label>
                <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Style="z-index: 1; left: 128px; top: 40px; position: absolute" Text="EXPORTAR TAREAS GENÉRICAS"></asp:Label>
            </div>
            <asp:Label ID="Label3" runat="server" CssClass="auto-style1" Style="z-index: 1; left: 17px; top: 101px; position: absolute" Text="Seleccionar Asignatura a Exportar:"></asp:Label>
            <asp:DropDownList AutoPostBack="true" ID="dropAsignaturas" runat="server" Style="z-index: 1; left: 19px; top: 127px; position: absolute; width: 281px; height: 19px; right: 266px;" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <div style="z-index: 1; left: 305px; top: 135px; position: absolute; height: 234px; width: 425px; overflow:scroll">
                <asp:GridView ID="gridTareas" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanging="gridTareas_SelectedIndexChanged">
                    <Columns>
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
                        <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                        <asp:BoundField DataField="TipoTarea" HeaderText="Tipo" ItemStyle-Width="150px">
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Button ID="Button1" runat="server" Height="50px" OnClick="Button1_Click" style="z-index: 1; left: 23px; top: 202px; position: absolute; width: 125px" Text="EXPORTAR XML" />
            <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 24px; top: 377px; position: absolute" Text="TAREAS EXPORTADAS EN FICHERO:"></asp:Label>
            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 26px; top: 396px; position: absolute; width: 83px"></asp:Label>

            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor.aspx" style="z-index: 1; left: 569px; top: 487px; position: absolute; width: 101px">Menu Profesor</asp:HyperLink>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 515px; top: 17px; position: absolute">Cerrar Sesión</asp:LinkButton>

        </div>
    </form>
</body>
</html>
