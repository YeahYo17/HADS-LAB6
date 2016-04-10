Imports System.Data.SqlClient

Public Class InsertarTarea

    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnAñadir_Click(sender As Object, e As EventArgs) Handles btnAñadir.Click

        Dim gridView As New GridView
        Dim dTable As New DataTable
        Dim dSet As New DataSet
        Dim Conexion As SqlConnection
        Conexion = Session("Conexion")
        Dim dAdapter As New SqlDataAdapter
        dAdapter = Session("dAdapter")
        dAdapter.SelectCommand = New SqlCommand("SELECT * FROM TareasGenericas", Conexion)
        Dim cmdBuild As New SqlCommandBuilder(dAdapter)

        dAdapter.Fill(dSet, "TareasGenericasProf")
        dTable = dSet.Tables("TareasGenericasProf")

        Dim dRow As DataRow = dTable.NewRow()

        dRow("Codigo") = txtCod.Text
        dRow("Descripcion") = txtDescrip.Text
        dRow("CodAsig") = listaAsig.Text
        dRow("HEstimadas") = txtHoras.Text
        dRow("Explotacion") = False
        dRow("TipoTarea") = listaTareas.Text

        dTable.Rows.Add(dRow)

        cmdBuild.GetInsertCommand()

        gridView = Session("GridView1")
        gridView.DataSourceID = Nothing
        gridView.DataSource = dTable
        gridView.DataBind()

        dAdapter.Update(dSet, "TareasGenericasProf")
        dSet.AcceptChanges()


    End Sub
End Class