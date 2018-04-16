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
        <div style="border-style: solid; border-color: inherit; border-width: medium; z-index: 1; left: 10px; top: 15px; position: absolute; height: 523px; width: 871px;">
            <div style="background-color: cornflowerblue; width: 689px; height: 70px; z-index: 1; left: 87px; top: 15px; position: absolute;">
                <asp:Label ID="label1" runat="server" CssClass="auto-style2" Style="z-index: 1; left: 301px; top: 10px; position: absolute" Text="PROFESOR"></asp:Label>
                <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Style="z-index: 1; left: 216px; top: 40px; position: absolute" Text="EXPORTAR TAREAS GENÉRICAS"></asp:Label>
            </div>
            <asp:Label ID="Label3" runat="server" CssClass="auto-style1" Style="z-index: 1; left: 19px; top: 140px; position: absolute" Text="Seleccionar Asignatura a Exportar:"></asp:Label>
            <asp:DropDownList AutoPostBack="true" ID="dropAsignaturas" runat="server" Style="z-index: 1; left: 19px; top: 166px; position: absolute; width: 238px; height: 19px; right: 544px;" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <div style="z-index: 1; left: 341px; top: 167px; position: absolute; height: 234px; width: 501px; overflow:scroll">
                <asp:GridView ID="gridTareas" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanging="gridTareas_SelectedIndexChanged" style="font-family: Verdana, Geneva, Tahoma, sans-serif" Width="239px">
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
            <asp:Button ID="Button1" runat="server" Height="50px" OnClick="Button1_Click" style="z-index: 1; left: 23px; top: 249px; position: absolute; width: 125px" Text="EXPORTAR XML" />
            <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 24px; top: 377px; position: absolute" Text="TAREAS EXPORTADAS EN FICHERO:" CssClass="auto-style1"></asp:Label>
            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 26px; top: 396px; position: absolute; width: 83px" CssClass="auto-style1"></asp:Label>

            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 680px; top: 88px; position: absolute" CssClass="auto-style1">Cerrar Sesión</asp:LinkButton>

            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="z-index: 1; left: 166px; top: 249px; position: absolute; height: 50px; width: 125px" Text="EXPORTAR JSON" />

            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Profesores/Profesor.aspx" style="z-index: 1; left: 82px; top: 84px; position: absolute">Volver al menu</asp:HyperLink>

        </div>
    </form>
</body>
</html>
