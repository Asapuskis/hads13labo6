Imports System.IO
Imports System.Xml
Imports Newtonsoft.Json

Public Class exportarTareas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim accesoDatosSQL As New accesoDatosSQL.accesoDatosSQL
        Dim dataAdapterTareas As New SqlClient.SqlDataAdapter
        Dim dataSetTareas As New DataSet("TareasGenericas")
        Dim dataTableTareas = New DataTable()

        lblExportar.Text = ""

        If Not IsPostBack Then
            lblUsuario.Text = Session("usuario")
            listaAsignaturas.DataSource = PAasignaturasProfesor
            listaAsignaturas.DataValueField = "codigoasig"
            listaAsignaturas.DataBind()

            dataAdapterTareas = accesoDatosSQL.tareasGenericas()
            dataAdapterTareas.Fill(dataSetTareas, "TareasGenericas")

            Session("dataset") = dataSetTareas
        Else
            dataSetTareas = Session("dataset")

        End If

        dataTableTareas = dataSetTareas.Tables("TareasGenericas")

        Dim dataViewTareas As New DataView(dataTableTareas)
        dataViewTareas.RowFilter = "codasig = '" + listaAsignaturas.SelectedValue + "'"

        Dim ds As New DataSet()
        Dim dt As New DataTable
        dt = dataViewTareas.ToTable
        For Each clm As DataColumn In dt.Columns
            clm.ColumnName = clm.ColumnName.ToLower
        Next
        dt.Columns(0).ColumnMapping = MappingType.Attribute 'Ponemos la columna codigo, la número 0 como atributo para luego crear bien el XML
        dt.Columns.Remove("CodAsig")
        ds.Tables.Add(dt)

        Session("dataSetXML") = ds

        gridTareas.DataSource = dataViewTareas
        gridTareas.DataBind()
        gridTareas.Columns(2).Visible = False

    End Sub

    Protected Sub btnExportarXML_Click(sender As Object, e As EventArgs) Handles btnExportarXML.Click
        Try
            Session("dataSetXML").Tables("TareasGenericas").TableName = "tarea"
            Session("dataSetXML").DataSetName = "tareas"
            Session("dataSetXML").Tables
            Session("dataSetXML").WriteXml(Server.MapPath("~/App_Data/" + listaAsignaturas.SelectedValue + ".xml"))

            lblExportar.Text = "La tabla se ha exportado correctamente a " + listaAsignaturas.SelectedValue + ".xml"

            Dim xd As XmlDocument = New XmlDocument()
            xd.Load(Server.MapPath("~/App_Data/" + listaAsignaturas.SelectedValue + ".xml"))
            xd.DocumentElement.SetAttribute("xmlns:" + listaAsignaturas.SelectedValue.ToLower, "http://ji.ehu.es/" + listaAsignaturas.SelectedValue.ToLower)

            xd.Save(Server.MapPath("~/App_Data/" + listaAsignaturas.SelectedValue + ".xml"))
            Session("dataSetXML").Tables("tarea").TableName = "TareasGenericas"
        Catch ex As Exception
            lblExportar.Text = "Ha habido un error al exportar las tareas a XML"
        End Try


    End Sub

    Protected Sub btnExpJSON_Click(sender As Object, e As EventArgs) Handles btnExpJSON.Click
        Try
            Dim jsonXML = JsonConvert.SerializeObject(Session("dataSetXML").Tables("TareasGenericas"), 1)
            File.WriteAllText(Server.MapPath("~/App_Data/" + listaAsignaturas.SelectedValue + ".json"), jsonXML.ToString())

            lblExportar.Text = "La tabla se ha exportado correctamente a " + listaAsignaturas.SelectedValue + ".json"
        Catch ex As Exception
            lblExportar.Text = "Ha habido un error al exportar las tareas a XML"
        End Try
    End Sub
End Class