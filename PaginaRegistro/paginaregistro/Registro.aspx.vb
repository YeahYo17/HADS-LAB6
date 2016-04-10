Imports System.Net.Mail

Public Class Registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click

        Dim libVb As New RegistroLibrary.LibraryVB

        Dim Comando1 As New SqlClient.SqlCommand
        Dim strSql As String

        Dim NumConf As Integer
        Dim DirEnlace As String

        Dim mail As MailMessage

        libVb.Conectar()

        If libVb.EmailRepetido(txtEmailReg.Text, lblError.Text) = False Then

            NumConf = libVb.InsertarUser(txtEmailReg.Text, txtNombre.Text, txtApellido1.Text, txtApellido2.Text, txtDni.Text, txtPassReg.Text, txtPregunta.Text, txtRespuesta.Text, lblError.Text)

            If NumConf <> -7 Then
                DirEnlace = Request.Url.Scheme & "://" & Request.Url.Host & ":" & Request.Url.Port & "/Confirmar.aspx?mbr=" & txtEmailReg.Text & "&NumConf=" & NumConf

                mail = libVb.CrearCorreo(txtEmailReg.Text)
                mail.Body = mail.Body & DirEnlace

                libVb.EnviarCorreo(mail, lblError.Text)
            End If

        End If

        libVb.Desconectar()

    End Sub
End Class