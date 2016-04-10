<%@ Page Language="vb" Debug="true" AutoEventWireup="false" CodeBehind="InsertarTareaXMLDocument.aspx.vb" Inherits="PaginaRegistro.InsertarTareaXMLDocument" %>

<%@ Register src="CabececeraProfesor.ascx" tagname="CabececeraProfesor" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <uc1:CabececeraProfesor ID="CabececeraProfesor2" runat="server" />
    <form id="form1" runat="server">
    <div style="height: 450px; width: 1315px; text-align: left;">
    
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
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 37px; top: 185px; position: absolute; width: 200px; height: 35px;" Text="IMPORTAR (XMLD)" />
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 37px; top: 94px; position: absolute; font-weight: 700;" Text="Seleccionar Asignatura a Importar: "></asp:Label>
    
        <br />
    
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 400px; top: 88px; position: absolute; height: 150px; width: 497px">
            <asp:Xml ID="Xml1" runat="server"></asp:Xml>
        </asp:Panel>
        <br />
        <br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" BorderColor="Silver" BorderWidth="1px" style="z-index: 1; left: 37px; top: 246px; position: absolute; height: 100px; width: 195px; font-weight: 700">
            <asp:ListItem Value="codigo">Codigo</asp:ListItem>
            <asp:ListItem Value="descripcion">Descripcion</asp:ListItem>
            <asp:ListItem Value="hestimadas">HEstimadas</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <br />
        <br />
        <asp:HyperLink ID="hlMenuProf" runat="server" NavigateUrl="~/Profesor.aspx" style="z-index: 1; left: 37px; top: 368px; position: absolute">Menu Profesor</asp:HyperLink>
    
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
