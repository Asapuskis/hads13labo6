Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnIniciarSesion_Click(sender As Object, e As EventArgs) Handles btnIniciarSesion.Click
        Page.Validate()
        If Page.IsValid Then
            Dim accesoDatosSQL = New accesoDatosSQL.accesoDatosSQL
            If accesoDatosSQL.iniciarSesion(txtUsu.Text, txtContr.Text) Then
                Dim tipoUsuario As String = accesoDatosSQL.tipo(txtUsu.Text)
                Session("tipoUsuario") = tipoUsuario
                Session("usuario") = txtUsu.Text
                If Session("usuario") = "vadillo@ehu.es" Then
                    System.Web.Security.FormsAuthentication.SetAuthCookie(Session("usuario"), True)
                    Response.Redirect("Profesores/profesor.aspx", True)
                Else
                    System.Web.Security.FormsAuthentication.SetAuthCookie(Session("tipoUsuario"), True)
                    If (tipoUsuario = "Profesor") Then
                        Response.Redirect("Profesores/profesor.aspx", True)
                    ElseIf tipoUsuario = "Alumno" Then
                        Response.Redirect("Alumnos/alumno.aspx", True)
                    ElseIf tipoUsuario = "Admin" Then
                        Response.Redirect("Admin/gestionUsuarios.aspx", True)
                    End If
                End If
                lblError.Visible = False
            Else
                lblError.Visible = True
            End If
        End If

    End Sub
End Class