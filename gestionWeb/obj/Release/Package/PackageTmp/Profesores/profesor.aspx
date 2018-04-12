<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="profesor.aspx.vb" Inherits="gestionWeb.profesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="margin:20px; font-family:Calibri">
    <form id="form1" runat="server">
    <div style="position:relative; top: 0px; left: 0px; width: 202px;">
    
        <asp:HyperLink ID="hyprAsignaturas" runat="server">Asignaturas</asp:HyperLink>
        <br />
        <asp:HyperLink ID="hyprTareas" runat="server" NavigateUrl="~/Profesores/tareasProfesor.aspx">Tareas</asp:HyperLink>
        <br />
        <asp:HyperLink ID="hprGrupos" runat="server">Grupos</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesores/importarTareasXML.aspx">Importar XML Document</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Profesores/exportarTareas.aspx">Exportar</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server">Importar DataSet</asp:HyperLink>
        <br />
    
    </div>
    <div style="position:relative; top: -111px; left: 210px; width: 1074px;" >
        <h2 style="text-align:center">Gestión Web de Tareas-Dedicación</h2>
        <h2 style="text-align:center">Profesor: 
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        </h2>
    </div>
        <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" />
    </form>
    </body>
</html>
