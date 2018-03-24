<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasProfesor.aspx.cs" Inherits="labsHADS.TareasProfesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        
        .auto-style2 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: medium;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="border-style: solid; border-color: inherit; border-width: medium; z-index: 1; left: 10px; top: 15px; position: absolute; height: 568px; width: 899px;">
            <div style="background-color: cornflowerblue; width: 624px; height: 70px; z-index: 1; left: 70px; top: 18px; position: absolute;">
                <asp:Label ID="label1" runat="server" CssClass="auto-style2" Style="z-index: 1; left: 228px; top: 10px; position: absolute" Text="PROFESOR"></asp:Label>
                <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Style="z-index: 1; left: 128px; top: 40px; position: absolute" Text="GESTIÓN DE TAREAS GENÉRICAS"></asp:Label>
            </div>
            
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 70px; top: 101px; position: absolute" Text="Seleccionar Asignatura:" Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig" style="z-index: 1; left: 70px; top: 127px; position: absolute">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase CROSS JOIN ProfesoresGrupo WHERE (ProfesoresGrupo.email = @email) AND (GruposClase.codigo = ProfesoresGrupo.codigogrupo)">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Button ID="insertar" runat="server" Text="Insertar Nueva Tarea" style="z-index: 1; left: 68px; top: 176px; position: absolute; height: 50px; right: 653px;" OnClick="insertar_Click" />

            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" style="z-index: 1; left: 64px; top: 257px; position: absolute; height: 133px; width: 187px">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" Visible="False" />
                    <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                    <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                    <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" SelectCommand="SELECT Codigo, Descripcion, CodAsig, HEstimadas, Explotacion, TipoTarea FROM TareasGenericas WHERE CodAsig = @asig" UpdateCommand="UPDATE TareasGenericas Set Descripcion = @Descripcion, HEstimadas = @HEstimadas, Explotacion = @Explotacion, TipoTarea = @TipoTarea WHERE Codigo=@Codigo">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="asig" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Descripcion" />
                    <asp:Parameter Name="HEstimadas" />
                    <asp:Parameter Name="Explotacion" />
                    <asp:Parameter Name="TipoTarea" />
                    <asp:Parameter Name="Codigo" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 605px; top: 99px; position: absolute">Cerrar Sesión</asp:LinkButton>

        </div>
    </form>
</body>
</html>
