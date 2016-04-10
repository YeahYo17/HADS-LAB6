<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Confirmar.aspx.vb" Inherits="PaginaRegistro.Confirmar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:Label ID="lblConfirmar" runat="server" style="font-weight: 700" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/Inicio.aspx" Visible="False">Volver Pagina Inicio</asp:HyperLink>
        <br />
    
    </div>
    </form>
</body>
</html>
