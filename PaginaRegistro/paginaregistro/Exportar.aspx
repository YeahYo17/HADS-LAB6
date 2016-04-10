<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Exportar.aspx.vb" Inherits="PaginaRegistro.Exportar" %>

<%@ Register src="CabececeraProfesor.ascx" tagname="CabececeraProfesor" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 565px">
    
        <uc1:CabececeraProfesor ID="CabececeraProfesor1" runat="server" />
        <br />
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 37px; top: 94px; position: absolute; font-weight: 700; right: 717px;" Text="Seleccionar Asignatura a Exportar: "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" style="z-index: 1; left: 37px; top: 124px; position: absolute; right: 696px; height: 25px; width: 320px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig">
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 495px; top: 94px; position: absolute; font-weight: 700;" Text="Lista de Tareas de la Asignatura Seleccionada: "></asp:Label>
        <asp:GridView ID="gvTareas" runat="server" style="z-index: 1; left: 495px; top: 124px; position: absolute; height: 133px; width: 520px" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource3">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    
        <asp:HyperLink ID="hlMenuProf" runat="server" NavigateUrl="~/Profesor.aspx" style="z-index: 1; left: 263px; top: 189px; position: absolute">Menu Profesor</asp:HyperLink>
    
        <asp:Button ID="btnExportar" runat="server" style="z-index: 1; left: 37px; top: 185px; position: absolute; width: 200px; height: 35px;" Text="EXPORTAR" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21ConnectionString %>" SelectCommand="SELECT codigoasig FROM [GruposClase] INNER JOIN [ProfesoresGrupo]  ON codigo=codigogrupo WHERE email=@email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21ConnectionString %>" SelectCommand="SELECT  [Codigo], [Descripcion], [CodAsig], [HEstimadas], [Explotacion], [TipoTarea] FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)" UpdateCommand="UPDATE [TareasGenericas] SET [Descripcion]=@Descripcion, [CodAsig]=@CodAsig, [Explotacion]=@Explotacion WHERE ([Codigo]=@Codigo)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="CodAsig" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descripcion" />
                <asp:Parameter Name="codAsig" />
                <asp:Parameter Name="Explotacion" />
                <asp:Parameter Name="Codigo" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
        <br />
        <br />
    
        <asp:Panel ID="Panel2" runat="server" style="z-index: 1; left: 38px; top: 243px; position: absolute; height: 325px; width: 360px" BorderColor="Red" BorderWidth="2px" Visible="False">
            &nbsp;&nbsp;
            <asp:Label ID="lblError" runat="server" style="z-index: 1; position: relative; color: #FF0000; font-weight: 700; font-size: large"></asp:Label>
        </asp:Panel>
    
        <asp:Panel ID="Panel3" runat="server" style="z-index: 1; left: 31px; top: 236px; position: absolute; height: 325px; width: 360px" BorderColor="#009900" BorderWidth="2px" Visible="False">
            &nbsp;&nbsp;
            <asp:Label ID="lblExito" runat="server" style="z-index: 1; position: relative; color: #009900; font-weight: 700; font-size: large"></asp:Label>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
