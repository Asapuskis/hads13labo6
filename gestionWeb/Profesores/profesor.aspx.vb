Public Class profesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblUsuario.Text = Session("usuario")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session.Remove("usuario")
        Session.Remove("tipoUsuario")
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("~/Inicio.aspx")
    End Sub
End Class