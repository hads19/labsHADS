<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerUsuarios.aspx.cs" Inherits="labsHADS.Admin.VerUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 610px; width: 1054px;">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Style="z-index: 1; left: 446px; top: 53px; position: absolute; width: 139px">Cerrar Sesión</asp:LinkButton>

            <div style="height: 469px; z-index: 1; left: 97px; top: 125px; position: absolute; width: 844px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="SqlDataSource1" Height="459px" Width="841px">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                        <asp:BoundField DataField="numconfir" HeaderText="numconfir" SortExpression="numconfir" />
                        <asp:CheckBoxField DataField="confirmado" HeaderText="confirmado" SortExpression="confirmado" />
                        <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [email] = @email" InsertCommand="INSERT INTO [Usuarios] ([email], [nombre], [apellidos], [numconfir], [confirmado], [tipo]) VALUES (@email, @nombre, @apellidos, @numconfir, @confirmado, @tipo)" SelectCommand="SELECT [email], [nombre], [apellidos], [numconfir], [confirmado], [tipo] FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [nombre] = @nombre, [apellidos] = @apellidos, [numconfir] = @numconfir, [confirmado] = @confirmado, [tipo] = @tipo WHERE [email] = @email">
                <DeleteParameters>
                    <asp:Parameter Name="email" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="apellidos" Type="String" />
                    <asp:Parameter Name="numconfir" Type="Int32" />
                    <asp:Parameter Name="confirmado" Type="Boolean" />
                    <asp:Parameter Name="tipo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="apellidos" Type="String" />
                    <asp:Parameter Name="numconfir" Type="Int32" />
                    <asp:Parameter Name="confirmado" Type="Boolean" />
                    <asp:Parameter Name="tipo" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
