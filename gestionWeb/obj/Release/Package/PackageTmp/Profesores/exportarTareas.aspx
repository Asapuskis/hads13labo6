<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="exportarTareas.aspx.vb" Inherits="gestionWeb.exportarTareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="margin:20px; font-family:Calibri">
    <form id="form1" runat="server">
    <div>
        <h2>PROFESOR
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        </h2>
        <h2>EXPORTAR TAREAS GENÉRICAS</h2>
        <p>Seleccione la asignatura a exportar: </p>

        <br />
        <asp:DropDownList ID="listaAsignaturas" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="PAasignaturasProfesor" runat="server" ConnectionString="<%$ ConnectionStrings:hads13ConnectionString %>" SelectCommand="asignaturasProfesor" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="blanco@ehu.es" Name="email" SessionField="usuario" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <div style="margin:auto;">
            <asp:GridView ID="gridTareas" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:BoundField DataField="codigo" HeaderText="Codigo" SortExpression="codigo" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
                <asp:BoundField DataField="codasig" HeaderText="Codasig" SortExpression="codasig" />
                <asp:BoundField DataField="hestimadas" HeaderText="Horas estimadas" SortExpression="hestimadas" />
                <asp:BoundField DataField="explotacion" HeaderText="Explotacion" SortExpression="explotacion" />
                <asp:BoundField DataField="tipotarea" HeaderText="Tipo tarea" SortExpression="tipotarea" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        </div>
        <br />
        <br />
        <asp:Button ID="btnExportarXML" runat="server" Text="Exportar XML" />
        &nbsp;<asp:Button ID="btnExpJSON" runat="server" Text="Exportar JSON" />
        <br />
        <br />
        <asp:Label ID="lblExportar" runat="server"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="hprMenu" runat="server" NavigateUrl="~/Profesores/profesor.aspx">Menu profesor</asp:HyperLink>

    </div>
    </form>
</body>
</html>
