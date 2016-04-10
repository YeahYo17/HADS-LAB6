Imports System.Data.SqlClient, System.Xml

Public Class InsertarTareaDataSet
    Inherits System.Web.UI.Page

    Private hadError As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strXml As String = "App_Data/" & DropDownList1.SelectedValue & ".xml"
        Panel2.Visible = False
        Panel3.Visible = False
        hadError = False

        If IsPostBack = False Then

            DropDownList1.DataBind()
            DropDownList1.Items.Add("- Seleccionar Asignatura -")
            DropDownList1.SelectedIndex = -1
            DropDownList1.Items.FindByText("- Seleccionar Asignatura -").Selected = True

            If My.Computer.FileSystem.FileExists(Server.MapPath(strXml)) = False Then
                Exit Sub
            End If

        Else
            If DropDownList1.Items.FindByText("- Seleccionar Asignatura -").Selected = True Then
                Exit Sub
            End If
            If My.Computer.FileSystem.FileExists(Server.MapPath(strXml)) = False Then
                lblError.Text = "ERROR - File Not Found: " & DropDownList1.SelectedValue.ToString & ".xml"
                Panel2.Visible = True
                hadError = True
                Exit Sub
            End If
        End If

        Xml1.DocumentSource = Server.MapPath(strXml)
        Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Panel2.Visible = False
        Panel3.Visible = False

        Dim strXml As String = "App_Data/" & DropDownList1.SelectedValue & ".xml"
        Dim readXml As XmlReader
        If My.Computer.FileSystem.FileExists(Server.MapPath(strXml)) = True Then
            readXml = XmlReader.Create(Server.MapPath(strXml))
        Else
            lblError.Text = "ERROR - File Not Found: " & DropDownList1.SelectedValue.ToString & ".xml"
            Panel2.Visible = True
            hadError = True
            Exit Sub
        End If

        Dim Conexion As SqlConnection
        Conexion = Session("Conexion")
        Dim dTable As New DataTable("TareasSQL")
        Dim dAdapter As SqlDataAdapter
        dAdapter = Session("dAdapter")
        dAdapter.SelectCommand = New SqlCommand("SELECT * FROM TareasGenericas", Conexion)
        Dim cmdBuild As New SqlCommandBuilder(dAdapter)

        Dim dSet As New DataSet
        dAdapter.Fill(dTable)
        dSet.Tables.Add(dTable)

        Dim dRow As DataRow = dTable.NewRow()

        dRow("CodAsig") = DropDownList1.SelectedValue.ToString

        While readXml.Read()
            Select Case readXml.Name
                Case "codigo"
                    If readXml.NodeType = XmlNodeType.Element Then
                        readXml.Read()
                        dRow("Codigo") = readXml.Value
                    End If
                Case "descripcion"
                    If readXml.NodeType = XmlNodeType.Element Then
                        readXml.Read()
                        dRow("Descripcion") = readXml.Value
                    End If
                Case "hestimadas"
                    If readXml.NodeType = XmlNodeType.Element Then
                        readXml.Read()
                        dRow("HEstimadas") = CInt(readXml.Value)
                    End If
                Case "explotacion"
                    If readXml.NodeType = XmlNodeType.Element Then
                        readXml.Read()
                        dRow("Explotacion") = CBool(readXml.Value)
                    End If
                Case "tipotarea"
                    If readXml.NodeType = XmlNodeType.Element Then
                        readXml.Read()
                        dRow("TipoTarea") = readXml.Value
                        dTable.Rows.Add(dRow.ItemArray)
                    End If
                Case "tareas"
                    If readXml.NodeType = XmlNodeType.EndElement Then
                        Exit While
                    End If
            End Select
        End While


        cmdBuild.GetInsertCommand()

        Try
            dAdapter.Update(dTable)
        Catch ex As Exception
            lblError.Text = "ERROR: " & ex.Message
            Panel2.Visible = True
            hadError = True
        End Try

        dSet.AcceptChanges()

        If hadError = False Then
            lblExito.Text = "Se ha importado el archivo '" & DropDownList1.SelectedValue & ".xml' CORRECTAMENTE."
            Panel3.Visible = True
        End If

    End Sub

End Class