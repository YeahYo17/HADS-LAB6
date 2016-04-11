Imports System.Data.SqlClient
Imports System.Web.Security.FormsAuthentication

Public Class Inicio

    Inherits System.Web.UI.Page

    Private Conexion As SqlConnection = New SqlConnection("Server=tcp:hads21.database.windows.net,1433;Database=HADS21;User ID=starkgs@hotmail.com@hads21;Password=HADS21perro;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;MultipleActiveResultSets=true")


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Conexion") = Conexion
        Session("dAdapter") = New SqlDataAdapter
        Session("email") = Nothing

        ' --- Desconectarse ---
        SignOut()

        ' --- Borrar Cookie: GALLETASAUTH ---

        'Dim aCookie As HttpCookie
        'Dim cookieName As String = "GALLETASAUTH"
        'aCookie = New HttpCookie(cookieName)
        'aCookie.Expires = DateTime.Now.AddDays(-1)
        'Response.Cookies.Add(aCookie)

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click

        Dim libVb As New RegistroLibrary.LibraryVB

        libVb.Conectar()

        ' --- Password Encriptado ---
        'If libVb.InicioSesionCorrectoEncrypt(txtEmailInc.Text, txtPassInc.Text, lblError.Text) = True Then
        ' --- Password no Encriptado ---
        If libVb.InicioSesionCorrecto(txtEmailInc.Text, txtPassInc.Text, lblError.Text) = True Then

            Session("email") = txtEmailInc.Text
            'Response.Redirect("Principal.aspx")

            If txtEmailInc.Text = "admin@ehu.es" Then
                SetAuthCookie("admin@ehu.es", False)
                Response.Redirect("Profesor/Profesor.aspx")
            End If

            If libVb.isProfesor(Session("email").ToString, lblError.Text) = True Then
                If txtEmailInc.Text = "vadillo@ehu.es" Then
                    SetAuthCookie("vadillo@ehu.es", False)
                Else
                    SetAuthCookie("Profesor", False)
                End If
                Response.Redirect("Profesor/Profesor.aspx")
            Else
                SetAuthCookie("Alumno", False)
                Response.Redirect("Alumno/Alumno.aspx")
            End If

        End If

        libVb.Desconectar()

    End Sub
End Class