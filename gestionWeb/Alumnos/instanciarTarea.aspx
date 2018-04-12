<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="instanciarTarea.aspx.vb" Inherits="gestionWeb.instanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="margin:20px; font-family:Calibri">
    <form id="form1" runat="server">
    <div>
    
        <h2 style="text-align:center">ALUMNO: 
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        </h2>
        <h2 style="text-align:center">INSTANCIAR TAREA GENÉRICA</h2><br />
        <br />
        <div style="width:20%; position:relative; top: 39px; left: 278px;">
             Usuario
            <asp:TextBox ID="txtUsuario" runat="server" Enabled="False"></asp:TextBox>
            <br />
            Tarea
            <asp:TextBox ID="txtTarea" runat="server" Enabled="False"></asp:TextBox>
            <br />
            Horas Est.
            <asp:TextBox ID="txtHorasEst" runat="server" Enabled="False"></asp:TextBox>
            <br />
            Horas Reales.
            <asp:TextBox ID="txtHorasReales" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqrdHorasReales" runat="server" ControlToValidate="txtHorasReales" EnableClientScript="False" ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnCrearTarea" runat="server" Text="Crear Tarea" />
            <br />
            <br />
            <asp:HyperLink ID="hyprPagAnterior" runat="server" NavigateUrl="~/Alumnos/tareasAlumnos.aspx">Página anterior</asp:HyperLink>
            <br />
        </div>
       
        <div style="width:40%; position:relative; top: -149px; left: 744px;">
            <asp:GridView ID="gridTareas" runat="server" AutoGenerateColumns="False" DataKeyNames="Email,CodTarea" DataSourceID="SqlDataSourceTareasAlumno" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                <asp:BoundField DataField="CodTarea" HeaderText="CodTarea" ReadOnly="True" SortExpression="CodTarea" />
                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                <asp:BoundField DataField="HReales" HeaderText="HReales" SortExpression="HReales" />
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
        <asp:SqlDataSource ID="SqlDataSourceTareasAlumno" runat="server" ConnectionString="<%$ ConnectionStrings:hads13ConnectionString %>" SelectCommand="SELECT * FROM [EstudiantesTareas] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:SessionParameter Name="Email" SessionField="usuario" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        </div>
        
        <br />
        <br />
    
          <div style="position:relative; top: -163px; left: 277px; width: 397px; margin-top: 0px;"><asp:Label ID="lblCrearTarea" runat="server"></asp:Label></div>
        
    
    </div>
    </form>
</body>
</html>
