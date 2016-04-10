Imports System.Data.SqlClient

Public Class InstanciarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Panel1.Visible = False
        lblModif.Visible = False

        Dim codUrl As String = Request.QueryString("codigo")
        txtUser.Text = Session("email").ToString
        txtTarea.Text = codUrl

        Dim libVB As New RegistroLibrary.LibraryVB
        libVB.Conectar()

        Dim hEstim As Integer
        If libVB.HEstimadasInstanciar(codUrl, hEstim, lblError.Text) Then
            txtHEst.Text = hEstim
        Else
            txtHEst.Text = ""
        End If
        libVB.Desconectar()


    End Sub

    Protected Sub btnCrear_Click(sender As Object, e As EventArgs) Handles btnCrear.Click
        Dim hadError As Boolean = False
        Panel1.Visible = False
        lblModif.Visible = False

        Dim dTable As New DataTable
        Dim dSet As New DataSet
        Dim Conexion As SqlConnection
        Conexion = Session("Conexion")
        Dim dAdapter As SqlDataAdapter
        dAdapter = Session("dAdapter")
        dAdapter.SelectCommand = New SqlCommand("SELECT * FROM EstudiantesTareas WHERE Email='" & Session("email").ToString & "'", Conexion)

        Dim cmdBuild As New SqlCommandBuilder(dAdapter)

        dAdapter.Fill(dSet, "TareasGenericasAlum")
        dTable = dSet.Tables("TareasGenericasAlum")

        Dim dRow As DataRow = dTable.NewRow()

        dRow("Email") = txtUser.Text
        dRow("CodTarea") = txtTarea.Text
        dRow("HEstimadas") = txtHEst.Text
        dRow("HReales") = txtHReal.Text

        dTable.Rows.Add(dRow)

        cmdBuild.GetInsertCommand()

        Try
            dAdapter.Update(dSet, "TareasGenericasAlum")
        Catch ex As Exception
            lblError.Text = "ERROR: " & ex.Message
            Panel1.Visible = True
            hadError = True
        End Try

        dSet.AcceptChanges()

        If hadError = False Then

            GridView3.DataSourceID = Nothing
            GridView3.DataSource = dTable
            GridView3.DataBind()

            lblModif.Visible = True
        End If


    End Sub
End Class