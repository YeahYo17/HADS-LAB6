Public Class NewRegistro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click

        lblEnlace.Visible = False

        Dim libVb As New RegistroLibrary.LibraryVB
        Dim cambiosBD As Integer = -7

        Dim txtEncrypt As String = libVb.Encrypt3DSMD5(txtPassReg.Text)

        libVb.Conectar()

        If libVb.EmailRepetido(txtEmailReg.Text, lblError.Text) = False Then

            ' --- Password sin encriptacion ---
            'cambiosBD = libVb.InsertarUserAzure(txtEmailReg.Text, txtNombre.Text, txtPregunta.Text, txtRespuesta.Text, txtDni.Text, txtGrupo.Text, rdbTipo.SelectedValue.ToString, txtPassReg.Text, lblError.Text)
            ' --- Password con encriptacion ---
            cambiosBD = libVb.InsertarUserAzure(txtEmailReg.Text, txtNombre.Text, txtPregunta.Text, txtRespuesta.Text, txtDni.Text, txtGrupo.Text, rdbTipo.SelectedValue.ToString, txtEncrypt, lblError.Text)
            If cambiosBD <> -7 Then
                lblError.Visible = False
                lblEnlace.Visible = True
                lblEnlace.Text = "Se ha ingresado '" & cambiosBD & "' usuario/s en la BD."
            End If
        End If

        libVb.Desconectar()

    End Sub

End Class