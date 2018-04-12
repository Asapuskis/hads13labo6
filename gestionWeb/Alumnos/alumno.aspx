<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="alumno.aspx.vb" Inherits="gestionWeb.alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="margin:20px; font-family:Calibri">
    <div style="position:relative; width:20%">
        <form id="form1" runat="server" dir="ltr"  >
            <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar sesión" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:HyperLink ID="hyprTarGen" runat="server" NavigateUrl="~/Alumnos/tareasAlumnos.aspx">Tareas Genéricas</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="hyprTarPro" runat="server">Tareas Propias</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="hyprGrup" runat="server">Grupos</asp:HyperLink>
            <br />
            <br />
        </form>
    </div>
    <div style="position:relative; width:80%; left: -344px; left: 271px; width: 926px; height: 341px; text-align:center; margin-top:20px; top: -169px;">
     <h1>Gestión Web de Tareas-Dedicación</h1>
        <h1>Alumno: 
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        </h1>
    </div>
    
    </body>
</html>
