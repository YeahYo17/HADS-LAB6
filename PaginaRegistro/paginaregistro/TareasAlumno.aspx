<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasAlumno.aspx.vb" Inherits="PaginaRegistro.TareasAlumno" %>

<%@ Register src="CabeceraAlumno.ascx" tagname="CabeceraAlumno" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            width: 1315px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:CabeceraAlumno ID="CabeceraAlumno1" runat="server" />
    <div style="font-weight: 700; width: 1305px; height: 400px;">
    
        <br />
        Seleccionar Asignatura (solo se muestran aquellas en las que está matriculado):<br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="225px" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=tcp:hads21.database.windows.net,1433;Initial Catalog=HADS21;Persist Security Info=True;User ID=starkgs@hotmail.com@hads21;Password=HADS21perro" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoasig FROM [GruposClase] INNER JOIN [EstudiantesGrupo]  ON codigo=Grupo WHERE email=@email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21ConnectionString %>" SelectCommand="SELECT TareasGenericas.Codigo AS &quot;Codigo&quot;,TareasGenericas.Descripcion AS &quot;Descripcion&quot;, TareasGenericas.HEstimadas AS &quot;Horas&quot;, TareasGenericas.TipoTarea AS &quot;Tipo Tarea&quot; FROM [EstudiantesGrupo] INNER JOIN [GruposClase] ON Grupo=GruposClase.codigo INNER JOIN [TareasGenericas] ON codigoasig=CodAsig   WHERE EstudiantesGrupo.Email=@email AND CodAsig=@Asig AND Explotacion=1 EXCEPT SELECT TareasGenericas.Codigo,TareasGenericas.Descripcion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea FROM [EstudiantesTareas] INNER JOIN [TareasGenericas]  ON EstudiantesTareas.CodTarea=TareasGenericas.Codigo">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
                <asp:ControlParameter ControlID="DropDownList1" Name="Asig" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: left; z-index: 1; left: 650px; top: 99px; position: absolute; height: 197px; width: 600px;" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource2">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" SelectText="Instanciar" ShowSelectButton="True" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" />
                <asp:BoundField DataField="Tipo Tarea" HeaderText="Tipo Tarea" SortExpression="Tipo Tarea" />
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
        <asp:HyperLink ID="hlMenu" runat="server" NavigateUrl="~/Alumno.aspx" style="z-index: 1; left: 283px; top: 272px; position: absolute">Menu Principal</asp:HyperLink>
        <br />
    
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" BorderColor="Silver" BorderWidth="1px" style="z-index: 1; left: 281px; top: 138px; position: absolute; height: 90px; width: 120px">
            <asp:ListItem Enabled="False" Selected="True">Codigo</asp:ListItem>
            <asp:ListItem>Descripcion</asp:ListItem>
            <asp:ListItem>Horas</asp:ListItem>
            <asp:ListItem>Tipo Tarea</asp:ListItem>
        </asp:CheckBoxList>
    
    </div>
    </form>
</body>
</html>
