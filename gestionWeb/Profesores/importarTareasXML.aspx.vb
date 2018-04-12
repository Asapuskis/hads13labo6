Imports System.Xml
Imports System.IO
Public Class importarTareasXML
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            lblUsuario.Text = Session("usuario")
            listaAsignaturas.DataSource = PAasignaturasProfesor
            listaAsignaturas.DataBind()
        End If

        Dim asignatura As String = listaAsignaturas.SelectedItem.Text

        If File.Exists(Server.MapPath("~/App_Data/" + asignatura + ".xml")) Then
            xmlTareas.DocumentSource = Server.MapPath("~/App_Data/" + asignatura + ".xml")
            xmlTareas.TransformSource = Server.MapPath("~/App_Data/XSLTFile.xsl")
            xmlTareas.DataBind()

            btnOrdenarCodigo.Visible = True
            btnOrdenarDescripcion.Visible = True
            btnOrdenarHestimadas.Visible = True

            lblInsertar.Text = ""
        Else
            lblInsertar.Text = "No se encuentra el archivo ~/App_Data/" + asignatura + ".xml"
            btnOrdenarCodigo.Visible = False
            btnOrdenarDescripcion.Visible = False
            btnOrdenarHestimadas.Visible = False
        End If

    End Sub

    Protected Sub btnImportar_Click(sender As Object, e As EventArgs) Handles btnImportar.Click
        Dim accesoDatosSQL As New accesoDatosSQL.accesoDatosSQL
        Dim xmlDoc As New XmlDocument

        xmlDoc.Load(Server.MapPath("~/App_Data/" + listaAsignaturas.SelectedItem.Text + ".xml"))

        Dim dapter As New SqlClient.SqlDataAdapter
        dapter = accesoDatosSQL.tareasGenericas()
        Dim bldMbrs As New SqlClient.SqlCommandBuilder(dapter)
        Dim dataSetTareas = New DataSet()
        dapter.Fill(dataSetTareas, "TareasGenericas")
        Dim dataTableTareas = New DataTable()
        dataTableTareas = dataSetTareas.Tables("TareasGenericas")

        Dim tareas As XmlNodeList
        tareas = xmlDoc.GetElementsByTagName("tarea")
        Dim i As Integer
        For i = 0 To tareas.Count - 1
            Dim n As XmlNode = tareas(i)
            Dim descripcion As String = n.Item("descripcion").InnerText
            Dim hestimadas As Integer = n.Item("hestimadas").InnerText
            Dim explotacion As Boolean = n.Item("explotacion").InnerText
            Dim tipotarea As String = n.Item("tipotarea").InnerText
            Dim xmlAtt As XmlAttributeCollection = n.Attributes
            Dim codigo As String = xmlAtt.ItemOf("codigo")?.Value

            Dim nuevaTarea As DataRow = dataTableTareas.NewRow
            nuevaTarea("codigo") = codigo
            nuevaTarea("descripcion") = descripcion
            nuevaTarea("codasig") = listaAsignaturas.SelectedItem.Text
            nuevaTarea("hestimadas") = hestimadas
            nuevaTarea("explotacion") = explotacion
            nuevaTarea("tipotarea") = tipotarea

            dataTableTareas.Rows.Add(nuevaTarea)
        Next

        Try
            dapter.Update(dataSetTareas, "TareasGenericas")
            dataSetTareas.AcceptChanges()
            lblInsertar.Text = "Las tareas se han importado correctamente."
        Catch ex As Exception
            lblInsertar.Text = "Las tareas ya están importadas."
        End Try

    End Sub

    Protected Sub btnOrdenarDescripcion_Click(sender As Object, e As EventArgs) Handles btnOrdenarDescripcion.Click
        xmlTareas.DocumentSource = Server.MapPath("~/App_Data/" + listaAsignaturas.SelectedValue + ".xml")
        xmlTareas.TransformSource = Server.MapPath("~/App_Data/OrdenarDescripcion.xsl")
        lblInsertar.Text = "Tabla XML ordenada por descripción."
    End Sub

    Protected Sub btnOrdenarCodigo_Click(sender As Object, e As EventArgs) Handles btnOrdenarCodigo.Click
        xmlTareas.DocumentSource = Server.MapPath("~/App_Data/" + listaAsignaturas.SelectedValue + ".xml")
        xmlTareas.TransformSource = Server.MapPath("~/App_Data/OrdenarCodigo.xsl")
        lblInsertar.Text = "Tabla XML ordenada por código."
    End Sub

    Protected Sub btnOrdenarHestimadas_Click(sender As Object, e As EventArgs) Handles btnOrdenarHestimadas.Click
        xmlTareas.DocumentSource = Server.MapPath("~/App_Data/" + listaAsignaturas.SelectedValue + ".xml")
        xmlTareas.TransformSource = Server.MapPath("~/App_Data/OrdenarHestimadas.xsl")
        lblInsertar.Text = "Tabla XML ordenada por horas estimadas."
    End Sub
End Class