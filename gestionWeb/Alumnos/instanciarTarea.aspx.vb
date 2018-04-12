Public Class instanciarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblUsuario.Text = Session("usuario")
        If Not IsPostBack Then
            Dim codigoAsignatura As String = Request.QueryString("codigo")
            Dim hEstimadas As String = Request.QueryString("hEstimadas")
            txtUsuario.Text = Session("usuario")
            txtTarea.Text = codigoAsignatura
            txtHorasEst.Text = hEstimadas
        End If

    End Sub

    Protected Sub btnCrearTarea_Click(sender As Object, e As EventArgs) Handles btnCrearTarea.Click
        Page.Validate()
        If Page.IsValid Then
            Dim accesoDatosSql = New accesoDatosSQL.accesoDatosSQL
            Dim mensaje As String = accesoDatosSql.insertarTarea(txtUsuario.Text, txtTarea.Text, txtHorasEst.Text, txtHorasReales.Text)
            lblCrearTarea.Text = mensaje
            gridTareas.DataBind()
        End If
    End Sub
End Class