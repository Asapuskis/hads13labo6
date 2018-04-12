Public Class tareasProfesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblUsuario.Text = Session("usuario")
    End Sub

    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session.Remove("dataView")
        Session.Remove("usuario")
        Session.Remove("tipoUsuario")
        Session.Remove("dataSet")
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("~/Inicio.aspx")
    End Sub

    Protected Sub btnInsTarea_Click(sender As Object, e As EventArgs) Handles btnInsTarea.Click
        Response.Redirect("insertarTarea.aspx")
    End Sub
End Class