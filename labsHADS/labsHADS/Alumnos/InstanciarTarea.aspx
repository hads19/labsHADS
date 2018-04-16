<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstanciarTarea.aspx.cs" Inherits="labsHADS.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        .auto-style2 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
    </style>
</head>
<body style="height: 532px; width: 708px">
    <form id="form1" runat="server">
        <div style="height: 529px; margin-left: 3px; width: 712px;">
            <div style="z-index: 1; left: 117px; top: 38px; position: absolute; height: 65px; width: 514px; background-color:aquamarine">

                <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 219px; top: 12px; position: absolute; bottom: 34px" Text="ALUMNOS" CssClass="auto-style1"></asp:Label>
                <asp:Label ID="Label2" runat="server" style="z-index: 1; top: 36px; position: absolute; left: 142px" Text="INSTANCIAR TAREA GENÉRICA" CssClass="auto-style1"></asp:Label>

            </div>
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 65px; top: 140px; position: absolute; bottom: 278px;" Text="Usuario" CssClass="auto-style2"></asp:Label>
            <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 65px; top: 170px; position: absolute" Text="Tarea" CssClass="auto-style2"></asp:Label>
            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 65px; top: 200px; position: absolute" Text="Horas Est." CssClass="auto-style2"></asp:Label>
            <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 65px; top: 230px; position: absolute" Text="Horas Reales" CssClass="auto-style2"></asp:Label>

            <asp:TextBox ID="estimadas" runat="server" style="z-index: 1; left: 190px; top: 200px; position: absolute" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="reales" runat="server" style="z-index: 1; left: 190px; top: 230px; position: absolute"></asp:TextBox>
            <asp:TextBox ID="tarea" runat="server" style="z-index: 1; left: 190px; top: 170px; position: absolute" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="usuario" runat="server" style="z-index: 1; left: 190px; top: 140px; position: absolute" ReadOnly="True"></asp:TextBox>
            <asp:Button ID="crearTarea" runat="server" style="z-index: 1; left: 63px; top: 277px; position: absolute" Text="Crear Tarea" CssClass="auto-style2" OnClick="crearTarea_Click" />
            <asp:GridView AutoGenerateColumns="False" ID="gridTareas" runat="server" style="z-index: 1; left: 282px; top: 274px; position: absolute; height: 189px; width: 404px; font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: small;">
                <Columns>
                    <asp:BoundField DataField="Email" HeaderText="Email">
                    <HeaderStyle Width="150px" Wrap="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CodTarea" HeaderText="CodTarea">
                    <HeaderStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" />
                    <asp:BoundField DataField="HReales" HeaderText="HReales" />
                </Columns>
                
            </asp:GridView>
            <asp:HyperLink ID="HyperLink1" runat="server" style="z-index: 1; left: 46px; top: 412px; position: absolute; margin-bottom: 4px" CssClass="auto-style2" NavigateUrl="~/Alumnos/TareasAlumno.aspx">Página anterior</asp:HyperLink>
        </div>
    </form>
</body>
</html>
