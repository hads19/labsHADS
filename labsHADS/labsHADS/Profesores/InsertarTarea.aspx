<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertarTarea.aspx.cs" Inherits="labsHADS.InsertarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        </style>
</head>
<body style="height: 532px; width: 708px">
    <form id="form1" runat="server">
        <div style="height: 529px; margin-left: 3px; width: 712px;">

            <div style="z-index: 1; left: 117px; top: 38px; position: absolute; height: 65px; width: 514px; background-color:aquamarine">
                <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 219px; top: 12px; position: absolute; bottom: 34px" Text="PROFESOR" CssClass="auto-style1"></asp:Label>
                <asp:Label ID="Label2" runat="server" style="z-index: 1; top: 36px; position: absolute; left: 142px" Text="GESTIÓN DE TAREAS GENÉRICAS" CssClass="auto-style1"></asp:Label>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 100px; top: 130px; position: absolute" Text="Código"></asp:Label>
            <asp:TextBox ID="TextBoxCodigo" runat="server" style="z-index: 1; left: 220px; top: 125px; position: absolute"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="TextBoxCodigo" ForeColor="Red" style="z-index: 1; left: 400px; top: 125px; position: absolute"></asp:RequiredFieldValidator>

            <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 100px; top: 155px; position: absolute" Text="Descripción"></asp:Label>
            <asp:TextBox ID="TextBoxDescripcion" runat="server" style="z-index: 1; left: 220px; top: 155px; position: absolute; width: 250px; height: 16px;"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="TextBoxDescripcion" ForeColor="Red" style="z-index: 1; left: 500px; top: 155px; position: absolute"></asp:RequiredFieldValidator>

            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 100px; top: 180px; position: absolute" Text="Asignatura"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig" style="z-index: 1; left: 220px; top: 180px; position: absolute">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase CROSS JOIN ProfesoresGrupo WHERE (ProfesoresGrupo.email = @email) AND (GruposClase.codigo = ProfesoresGrupo.codigogrupo)">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 100px; top: 205px; position: absolute" Text="Horas Estimadas"></asp:Label>
            <asp:TextBox ID="TextBoxHEstimadas" runat="server" style="z-index: 1; left: 220px; top: 205px; position: absolute;"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="TextBoxCodigo" ForeColor="Red" style="z-index: 1; left: 400px; top: 205px; position: absolute"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxHEstimadas" ErrorMessage="*Valor Numérico" ForeColor="Red" style="z-index: 1; left: 530px; top: 205px; position: absolute" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>

            <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 100px; top: 230px; position: absolute" Text="Tipo Tarea"></asp:Label>
            <asp:TextBox ID="TextBoxTipo" runat="server" style="z-index: 1; left: 220px; top: 230px; position: absolute;"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="TextBoxCodigo" ForeColor="Red" style="z-index: 1; left: 400px; top: 230px; position: absolute"></asp:RequiredFieldValidator>

            <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 98px; top: 320px; position: absolute; height: 50px; width: 100px" Text="Añadir Tarea" OnClick="Button1_Click" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" InsertCommand="INSERT INTO TareasGenericas(Codigo, Descripcion, CodAsig, HEstimadas, Explotacion, TipoTarea) VALUES (@cod, @des, @codAsig, @hEst, 1, @tipo)" SelectCommand="SELECT * FROM [TareasGenericas]">
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBoxCodigo" Name="cod" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBoxDescripcion" Name="des" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="codAsig" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBoxHEstimadas" Name="hEst" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBoxTipo" Name="tipo" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>

            

            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesores/TareasProfesor.aspx" style="z-index: 1; left: 534px; top: 337px; position: absolute">Ver Tareas</asp:HyperLink>

            <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 103px; top: 405px; position: absolute; width: 197px"></asp:Label>

            <ajaxToolkit:DragPanelExtender ID="Label8_DragPanelExtender" runat="server" BehaviorID="Label8_DragPanelExtender" DragHandleID="Label8" TargetControlID="Label8">
            </ajaxToolkit:DragPanelExtender>

        </div>
    </form>
</body>
</html>
