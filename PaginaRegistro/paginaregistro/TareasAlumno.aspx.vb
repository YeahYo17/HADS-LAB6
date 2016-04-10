Public Class TareasAlumno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        For i = 0 To 3
            GridView2.Columns.Item(i + 1).Visible = CheckBoxList1.Items.Item(i).Selected
        Next

        If IsPostBack = False Then
            DropDownList1.DataBind()
            DropDownList1.Items.Add("- Seleccionar Asignatura -")
            DropDownList1.SelectedIndex = -1
            DropDownList1.Items.FindByText("- Seleccionar Asignatura -").Selected = True
        Else
            If DropDownList1.Items.FindByText("- Seleccionar Asignatura -").Selected = False Then
            End If
        End If

    End Sub

    Protected Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        Response.Redirect("InstanciarTarea.aspx?codigo=" & GridView2.SelectedValue.ToString & "")
    End Sub

    Protected Sub CheckBoxList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CheckBoxList1.SelectedIndexChanged

        For i = 0 To 3
            GridView2.Columns.Item(i + 1).Visible = CheckBoxList1.Items.Item(i).Selected
        Next

    End Sub

    'Protected Sub GridView_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridView1.Sorting
    '    Table = Session("tabla")
    'Dim vista As New DataView(Table)
    '    vista.Sort = e.SortExpression
    '    GridView1.DataSource = vista
    '    GridView1.DataBind()
    'End Sub

End Class