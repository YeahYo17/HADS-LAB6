Public Class Confirmar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lblError.Visible = False

        Dim libVb As New RegistroLibrary.LibraryVB

        Dim mbrUrl As String
        Dim numConfUrl As Integer

        libVb.Conectar()

        mbrUrl = Request.QueryString("mbr")
        numConfUrl = Request.QueryString("NumConf")

        If libVb.BuscarEmailConf(mbrUrl.ToString, numConfUrl, lblError.Text) Then
            lblConfirmar.Visible = True
            lblConfirmar.Text = "Se ha confirmado el registro satisfactoriamente, presiona el enlace inferior para volver a la pagina de Inicio."
            hlVolver.Visible = True
        Else
            Dim seg As Integer = 3

            lblError.Visible = True
            lblError.Text = "Ha habido un error en la confirmacion. Se le redireccionara a la pagina de Inicio en " & seg & " segundos.\n - " & lblError.Text

            System.Threading.Thread.Sleep(seg * 1000) '3 seg
            Response.Redirect("Inicio.aspx")
        End If

        libVb.Desconectar()

    End Sub
End Class