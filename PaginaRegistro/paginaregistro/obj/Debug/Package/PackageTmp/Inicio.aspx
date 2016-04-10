<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="PaginaRegistro.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 354px">
    
        <br />
        Email:<br />
        <asp:TextBox ID="txtEmailInc" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmailInc" ErrorMessage="No se ha introducido Email" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailInc" ErrorMessage="El formato de Email introducido es incorrecto" style="color: #FF0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Formato de Email Incorrecto</asp:RegularExpressionValidator>
        <br />
        <br />
        Password:<br />
        <asp:TextBox ID="txtPassInc" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassInc" ErrorMessage="No se ha introducido Email" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" Width="125px" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hyperLinkRegistro" runat="server" NavigateUrl="~/Registro.aspx">Registrate Aqui</asp:HyperLink>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CambiarPassword.aspx">Cambiar Contraseña</asp:HyperLink>
        <br />
        <br />
    
        <br />
        <asp:Label ID="lblError" runat="server" style="font-size: x-large; color: #FF0000"></asp:Label>
    
    </div>
    </form>
</body>
</html>
