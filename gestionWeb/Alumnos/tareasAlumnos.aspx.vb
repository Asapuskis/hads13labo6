Public Class tareasAlumnos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblUsuario.Text = Session("usuario")
        Dim accesoDatosSQL = New accesoDatosSQL.accesoDatosSQL
        Dim dataSetTareas As New DataSet()
        Try
            If Not IsPostBack Then

                Dim dataAdapterAsignaturas As SqlClient.SqlDataAdapter = accesoDatosSQL.asignaturasAlumno(Session("usuario"))
                Dim dataSetAsignaturas As New DataSet()
                dataAdapterAsignaturas.Fill(dataSetAsignaturas, "Asignaturas")

                Dim dataTableAsignaturas = New DataTable()
                dataTableAsignaturas = dataSetAsignaturas.Tables("Asignaturas")

                listaAsignaturas.DataSource = dataTableAsignaturas
                listaAsignaturas.DataValueField = "codigoasig"
                listaAsignaturas.DataBind()

                Dim dataAdapterTareas As SqlClient.SqlDataAdapter = accesoDatosSQL.tareasGenericas()

                dataAdapterTareas.Fill(dataSetTareas, "Tareas")

                Session("dataset") = dataSetTareas

            Else
                dataSetTareas = Session("dataset")
            End If

            Dim dataTableTareas = New DataTable()
            dataTableTareas = dataSetTareas.Tables("Tareas")

            Dim dataViewTareas As New DataView(dataTableTareas)
            dataViewTareas.RowFilter = "CodAsig = '" + listaAsignaturas.SelectedItem.Text + "' AND Explotacion = true"

            Session("dataView") = dataViewTareas

            gridTareasAlumno.DataSource = dataViewTareas
            gridTareasAlumno.DataBind()
            gridTareasAlumno.Columns(3).Visible = False 'Hacemos no visible la columna 3, correspondiente a el código de la asignatura.
            gridTareasAlumno.Columns(5).Visible = False 'Hacemos no visible la columna 5, correspondiente a si la asignatura se encuentra en explotación o no.
        Catch ex As Exception
            lblError.Text = "No se ha matriculado en ninguna asignatura."
        End Try

    End Sub

    Protected Sub gridTareasAlumno_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridTareasAlumno.SelectedIndexChanged
        Dim row As GridViewRow = gridTareasAlumno.SelectedRow

        Response.Redirect(“instanciarTarea.aspx?codigo=" + row.Cells(1).Text + "&hEstimadas=" + row.Cells(4).Text)                   'Cogemos el código de la asignatura en la posición 1.
    End Sub

    Protected Sub gridTareasAlumno_Sorting(sender As Object, e As GridViewSortEventArgs) Handles gridTareasAlumno.Sorting
        Dim dataViewTareas = Session("dataView")

        dataViewTareas.Sort = e.SortExpression

        gridTareasAlumno.DataSource = dataViewTareas
        gridTareasAlumno.DataBind()
    End Sub

    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session.Remove("dataView")
        Session.Remove("usuario")
        Session.Remove("tipoUsuario")
        Session.Remove("dataSet")
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("~/Inicio.aspx")
    End Sub
End Class