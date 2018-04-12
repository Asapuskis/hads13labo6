<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="insertarTarea.aspx.vb" Inherits="gestionWeb.insertarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="margin:20px; font-family:Calibri">
    <form id="form1" runat="server">
    <div>
        <h2 style="text-align:center">PROFESOR:
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        </h2>
        <h2 style="text-align:center">GESTIÓN DE TAREAS GENÉRICAS</h2>
        <p style="margin-left: 200px">
        <br />
        <asp:Label ID="Label1" runat="server" Text="Codigo: "></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCodigo" ErrorMessage="*"></asp:RequiredFieldValidator>
        </p>
        <p style="margin-left: 200px">
        <br />
        <asp:Label ID="Label2" runat="server" Text="Descripción: "></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtDescripcion" runat="server" Height="62px" Width="302px" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="*"></asp:RequiredFieldValidator>
        </p>
        <p style="margin-left: 200px">
        <br />
        <asp:Label ID="Label3" runat="server" Text="Asignatura: "></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ListaAsignaturas" runat="server" DataSourceID="PAasignaturasProfesor" DataTextField="codigoAsig" DataValueField="codigoAsig">
        </asp:DropDownList>
        </p>
        <asp:SqlDataSource ID="PAasignaturasProfesor" runat="server" ConnectionString="<%$ ConnectionStrings:hads13ConnectionString %>" SelectCommand="asignaturasProfesor" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="blanco@ehu.es" Name="email" SessionField="usuario" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p style="margin-left: 200px">
        <br />
        <asp:Label ID="Label4" runat="server" Text="Horas Estimadas: "></asp:Label>
        <asp:TextBox ID="txtHestimadas" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHestimadas" ErrorMessage="*"></asp:RequiredFieldValidator>
        </p>
        <p style="margin-left: 200px">
        <br />
        <asp:Label ID="Label5" runat="server" Text="Tipo de tarea: "></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="listaTipoTareas" runat="server">
            <asp:ListItem>Ejercicio</asp:ListItem>
            <asp:ListItem>Examen</asp:ListItem>
            <asp:ListItem>Laboratorio</asp:ListItem>
            <asp:ListItem>Trabajo</asp:ListItem>
        </asp:DropDownList>
        <br />
            <br />
            <br />
        <br />
        <asp:Button ID="btnInsertarTarea" runat="server" Text="Añadir Tarea" />
        <br />
        <br />
        <asp:Label ID="lblInsertTarea" runat="server"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hprVerTareas" runat="server" NavigateUrl="~/Profesores/tareasProfesor.aspx">Ver Tareas</asp:HyperLink>
        <br />
    
        </p>
    
    </div>
    </form>
</body>
</html>
