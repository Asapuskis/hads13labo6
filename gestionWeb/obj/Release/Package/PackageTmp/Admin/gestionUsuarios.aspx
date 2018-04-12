<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="gestionUsuarios.aspx.vb" Inherits="gestionWeb.gestionUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="email" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                <asp:BoundField DataField="numconfir" HeaderText="numconfir" SortExpression="numconfir" />
                <asp:CheckBoxField DataField="confirmado" HeaderText="confirmado" SortExpression="confirmado" />
                <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                <asp:BoundField DataField="pass" HeaderText="pass" SortExpression="pass" />
                <asp:CommandField ShowDeleteButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads13ConnectionString %>" SelectCommand="SELECT * FROM [Usuarios]" DeleteCommand="DELETE FROM Usuarios WHERE (email = @email)" UpdateCommand="UPDATE Usuarios SET nombre = @nombre, apellidos = @apellidos, numconfir = @numconfir, confirmado = @confirmado, tipo = @tipo, pass = @pass WHERE (email = @email)">
            <UpdateParameters>
                <asp:Parameter Name="email" />
                <asp:Parameter Name="nombre" />
                <asp:Parameter Name="apellidos" />
                <asp:Parameter Name="numconfir" />
                <asp:Parameter Name="confirmado" />
                <asp:Parameter Name="tipo" />
                <asp:Parameter Name="pass" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" />
    
    </div>
    </form>
</body>
</html>
