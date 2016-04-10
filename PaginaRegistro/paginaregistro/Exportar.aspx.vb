Imports System.Xml, System.Data.SqlClient

Public Class Exportar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Label2.Visible = False
        Panel2.Visible = False
        Panel3.Visible = False

        If IsPostBack = False Then
            DropDownList1.DataBind()
            DropDownList1.Items.Add("- Seleccionar Asignatura -")
            DropDownList1.SelectedIndex = -1
            DropDownList1.Items.FindByText("- Seleccionar Asignatura -").Selected = True
        Else
            If DropDownList1.Items.FindByText("- Seleccionar Asignatura -").Selected = False Then
                Label2.Visible = True
            End If
        End If

    End Sub

    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click

        Dim hadError As Boolean = False
        Panel2.Visible = False
        Panel3.Visible = False

        Dim Conexion As SqlConnection
        Conexion = Session("Conexion")
        Dim dTable As New DataTable
        Dim dAdapter As SqlDataAdapter
        dAdapter = Session("dAdapter")
        dAdapter.SelectCommand = New SqlCommand("SELECT * FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue.ToString & "'", Conexion)
        Dim cmdBuild As New SqlCommandBuilder(dAdapter)

        Dim dSet As New DataSet
        dAdapter.Fill(dSet, "TareasGenericasProfBD")
        dTable = dSet.Tables("TareasGenericasProfBD")

        dSet.AcceptChanges()

        Dim strXml As String = "App_Data/" & DropDownList1.SelectedValue & ".xml"

        Dim settings As XmlWriterSettings = New XmlWriterSettings()
        settings.Indent = True

        Using writer As XmlWriter = XmlWriter.Create(Server.MapPath(strXml), settings)

            writer.WriteStartDocument(True)     'standalone="yes"
            writer.WriteStartElement("tareas")
            writer.WriteAttributeString("xmlns", "has", Nothing, "http://ji.ehu.es/has")

            Dim tarea As DataRow
            For Each tarea In dTable.Rows
                writer.WriteStartElement("tarea")
                writer.WriteElementString("codigo", tarea.Item("Codigo").ToString)
                writer.WriteElementString("descripcion", tarea.Item("Descripcion").ToString)
                writer.WriteElementString("hestimadas", tarea.Item("HEstimadas").ToString)
                writer.WriteElementString("explotacion", CBool(tarea.Item("Explotacion")))
                writer.WriteElementString("tipotarea", tarea.Item("TipoTarea").ToString)
                writer.WriteEndElement()
            Next
            writer.WriteEndElement()
            writer.WriteEndDocument()
        End Using

        If hadError = False Then
            lblExito.Text = "Se ha exportado el archivo '" & DropDownList1.SelectedValue & ".xml' CORRECTAMENTE."
            Panel3.Visible = True
        End If

    End Sub

End Class