<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="PaginaRegistro.Inicio" %>

<%@ Register src="CabeceraInicio.ascx" tagname="CabeceraInicio" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 450px">
    
        <uc1:CabeceraInicio ID="CabeceraInicio1" runat="server" />
    
        <br />
        &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 266px; top: 112px; position: absolute; height: 40px; width: 170px">
&nbsp;
            <br />
&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmailInc" ErrorMessage="No se ha introducido Email" style="color: #FF0000; position: relative;">* Campo Obligatorio</asp:RequiredFieldValidator>
            &nbsp;&nbsp;
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" style="z-index: 1; left: 90px; top: 113px; position: absolute; height: 265px; width: 154px">
            <strong>Email:</strong><br />
            <asp:TextBox ID="txtEmailInc" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<br />
            <br />
            <strong>Password:</strong><br />
            <asp:TextBox ID="txtPassInc" runat="server" TextMode="Password"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" Width="125px" />
            <br />
            <br />
            <br />
            &nbsp;
            <asp:HyperLink ID="hyperLinkRegistro" runat="server" NavigateUrl="~/Registro.aspx">Registrate Aqui</asp:HyperLink>
            <br />
            <br />
            &nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CambiarPassword.aspx">Cambiar Contraseña</asp:HyperLink>
        </asp:Panel>
        <br />
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Panel ID="Panel4" runat="server" style="z-index: 1; left: 275px; top: 205px; position: absolute; height: 25px; width: 170px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassInc" ErrorMessage="No se ha introducido Email" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        </asp:Panel>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Panel ID="Panel3" runat="server" style="z-index: 1; left: 274px; top: 130px; position: absolute; height: 35px; width: 283px">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailInc" ErrorMessage="El formato de Email introducido es incorrecto" style="color: #FF0000; position: relative;" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Formato de Email Incorrecto</asp:RegularExpressionValidator>
        </asp:Panel>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <br />
        <br />
    
        <br />
        <asp:Label ID="lblError" runat="server" style="font-size: x-large; color: #FF0000; z-index: 1; left: 90px; top: 415px; position: absolute;"></asp:Label>
    
    </div>
    </form>
</body>
</html>
