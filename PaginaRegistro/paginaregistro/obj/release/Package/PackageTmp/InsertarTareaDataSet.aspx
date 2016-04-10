<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsertarTareaDataSet.aspx.vb" Inherits="PaginaRegistro.InsertarTareaDataSet" %>

<%@ Register src="CabececeraProfesor.ascx" tagname="CabececeraProfesor" tagprefix="uc1" %>
<%@ Register src="CabeceraAlumno.ascx" tagname="CabeceraAlumno" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <uc1:CabececeraProfesor ID="CabececeraProfesor2" runat="server" />
    <form id="form1" runat="server">
    <div style="height: 550px; width: 1315px;">
    
        <asp:Panel ID="Panel2" runat="server" style="z-index: 1; left: 925px; top: 94px; position: absolute; height: 325px; width: 360px" BorderColor="Red" BorderWidth="2px" Visible="False">
            &nbsp;&nbsp;
            <asp:Label ID="lblError" runat="server" style="z-index: 1; position: relative; color: #FF0000; font-weight: 700; font-size: large"></asp:Label>
        </asp:Panel>
    
        <br />
    
        <asp:DropDownList ID="DropDownList1" runat="server" style="z-index: 1; left: 37px; top: 124px; position: absolute; height: 25px; width: 270px" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21ConnectionString %>" SelectCommand="SELECT codigoasig FROM [GruposClase] INNER JOIN [ProfesoresGrupo]  ON codigo=codigogrupo WHERE email=@email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 37px; top: 185px; position: absolute; width: 200px; height: 35px;" Text="IMPORTAR (DataSet)" />
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 37px; top: 94px; position: absolute; font-weight: 700;" Text="Seleccionar Asignatura a Importar: "></asp:Label>
    
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 400px; top: 88px; position: absolute; height: 150px; width: 497px">
            <asp:Xml ID="Xml1" runat="server"></asp:Xml>
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:HyperLink ID="hlMenuProf" runat="server" NavigateUrl="~/Profesor.aspx" style="z-index: 1; left: 37px; top: 259px; position: absolute">Menu Profesor</asp:HyperLink>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
        <asp:Panel ID="Panel3" runat="server" style="z-index: 1; left: 920px; top: 88px; position: absolute; height: 325px; width: 360px" BorderColor="#009900" BorderWidth="2px" Visible="False">
            &nbsp;&nbsp;
            <asp:Label ID="lblExito" runat="server" style="z-index: 1; position: relative; color: #009900; font-weight: 700; font-size: large"></asp:Label>
        </asp:Panel>
    
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        </div>
    </form>
</body>
</html>
