<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="tareasProfesor.aspx.vb" Inherits="gestionWeb.tareasProfesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="margin:20px; font-family:Calibri">
    <form id="form1" runat="server">
    <div>
    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar sesión" />
        <h2 style="text-align:center">PROFESOR:
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        </h2>
        <h2 style="text-align:center">GESTIÓN DE TAREAS GENÉRICAS</h2>
    
        
        <br />
        Seleccionar asignatura:
    
        
        <br />
        <br />
        <asp:DropDownList ID="listaAsignaturas" runat="server" AutoPostBack="True" DataSourceID="PAasignaturasProfesor" DataTextField="codigoAsig" DataValueField="codigoAsig">
        </asp:DropDownList>
        <asp:SqlDataSource ID="PAasignaturasProfesor" runat="server" ConnectionString="<%$ ConnectionStrings:hads13ConnectionString %>" SelectCommand="asignaturasProfesor" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="blanco@ehu.es" Name="email" SessionField="usuario" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="btnInsTarea" runat="server" Text="INSERTAR NUEVA TAREA" />
        <br />
        <br />
        <asp:GridView ID="gridTareasProfesor" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Codigo" DataSourceID="PAtareasProfesor">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
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
    
        <asp:SqlDataSource ID="PAtareasProfesor" runat="server" ConnectionString="<%$ ConnectionStrings:hads13ConnectionString %>" DeleteCommand="DELETE FROM TareasGenericas WHERE (Codigo = @codigo)" SelectCommand="tareasProfesor" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE TareasGenericas SET Descripcion = @Descripcion, HEstimadas = @HEstimadas, Explotacion = @Explotacion, TipoTarea = @TipoTarea WHERE (Codigo = @Codigo)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="blanco@ehu.es" Name="email" SessionField="usuario" Type="String" />
                <asp:ControlParameter ControlID="listaAsignaturas" DefaultValue="HAS" Name="codigoAsig" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
