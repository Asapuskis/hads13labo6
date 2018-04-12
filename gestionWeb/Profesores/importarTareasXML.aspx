<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="importarTareasXML.aspx.vb" Inherits="gestionWeb.importarTareasXML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="margin:20px; font-family:Calibri">
    <form id="form1" runat="server">
    <h2>PROFESOR
        <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        </h2>
    <h2>IMPORTAR TAREAS GENÉRICAS</h2>
    
        <p>
            &nbsp;</p>
        <p>
            Seleccionar Asignatura a Importar:
        </p>
        <p>
            <asp:DropDownList ID="listaAsignaturas" runat="server" DataTextField="codigoasig" DataValueField="codigoasig" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="PAasignaturasProfesor" runat="server" ConnectionString="<%$ ConnectionStrings:hads13ConnectionString %>" SelectCommand="asignaturasProfesor" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="blanco@ehu.es" Name="email" SessionField="usuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:Button ID="btnImportar" runat="server" Text="Importar Tareas XML" />
        </p>
        <p>
            <asp:HyperLink ID="hprMenu" runat="server" NavigateUrl="~/Profesores/profesor.aspx">Menu profesor</asp:HyperLink>
        </p>
        <div>
                <div style="margin: auto; font-family:Calibri">

                    <asp:Xml ID="xmlTareas" runat="server" TransformSource="~/App_Data/XSLTFile.xsl" ></asp:Xml>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            <p>
                <asp:Button ID="btnOrdenarCodigo" runat="server" Text="Ordenar por codigo" Width="120px" />
&nbsp;<asp:Button ID="btnOrdenarDescripcion" runat="server" Text="Ordenar por descripcion" Width="146px" />
&nbsp;<asp:Button ID="btnOrdenarHestimadas" runat="server" Text="Ordenar por Horas Estimadas" Width="188px" />
            </p>
            <p>
                <asp:Label ID="lblInsertar" runat="server"></asp:Label>
            </p>
            <p>
                &nbsp;</p>
            <p>&nbsp;</p>

            

        </div>
    </form>
    
</body>
</html>
