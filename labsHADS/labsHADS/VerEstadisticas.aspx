<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerEstadisticas.aspx.cs" Inherits="labsHADS.VerEstadisticas" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="border-style:solid; height: 670px; z-index: 1; left: 10px; top: 15px; position: absolute; width: 701px;">
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" OnLoad="Chart1_Load" Width="616px" Style="z-index: 1; left: 12px; top: 253px; position: absolute; height: 350px; font-family: Arial;" Palette="Chocolate">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Codigo" YValueMembers="HEstimadas" ChartType="Bar">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" SelectCommand="SELECT [HEstimadas], [Codigo] FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CodAsig" PropertyName="SelectedValue" Type="String" DefaultValue="EDA1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor.aspx" style="z-index: 1; left: 509px; top: 164px; position: absolute; font-family: Verdana, Geneva, Tahoma, sans-serif">Volver al menú</asp:HyperLink>
            <asp:DropDownList AutoPostBack="true" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CodAsig" DataValueField="CodAsig" Style="z-index: 1; left: 27px; top: 174px; position: absolute; font-family: Verdana, Geneva, Tahoma, sans-serif;" OnLoad="DropDownList1_Load" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <div style=" background-color:aquamarine; width: 649px; height: 61px; z-index: 1; left: 22px; top: 33px; position: absolute; margin-bottom: 0px;">
                <asp:Label ID="Label1" runat="server" Style="z-index: 1; left: 247px; top: 19px; position: absolute; height: 19px; font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: large; font-weight: 700; right: 401px;" Text="ESTADÍSTICAS"></asp:Label>
                <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 1px; top: 75px; position: absolute; font-family: Verdana, Geneva, Tahoma, sans-serif" Text="Horas estimadas por tarea, filtro por asignatura"></asp:Label>
            </div>

        </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hads19acConnectionString %>" SelectCommand="SELECT DISTINCT [CodAsig] FROM [TareasGenericas]"></asp:SqlDataSource>
    </form>
</body>
</html>
