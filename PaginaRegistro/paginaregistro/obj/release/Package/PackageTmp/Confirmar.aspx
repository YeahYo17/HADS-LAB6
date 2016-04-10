<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Confirmar.aspx.vb" Inherits="PaginaRegistro.Confirmar" %>

<%@ Register src="CabeceraInicio.ascx" tagname="CabeceraInicio" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:CabeceraInicio ID="CabeceraInicio1" runat="server" />
        <br />
    
        <br />
        <asp:Label ID="lblConfirmar" runat="server" style="font-weight: 700" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblError" runat="server" style="font-size: x-large; color: #FF0000"></asp:Label>
    
        <br />
    
        <br />
        <br />
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/Inicio.aspx" Visible="False">Volver Pagina Inicio</asp:HyperLink>
        <br />
    
    </div>
    </form>
</body>
</html>
