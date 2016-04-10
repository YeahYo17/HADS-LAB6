<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarPassword.aspx.vb" Inherits="PaginaRegistro.CambiarPassword" %>

<%@ Register src="CabeceraInicio.ascx" tagname="CabeceraInicio" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 630px">
    
        <uc1:CabeceraInicio ID="CabeceraInicio1" runat="server" />
        <br />
&nbsp;
        &nbsp;
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailCP" ErrorMessage="El formato de Email introducido es incorrecto" style="color: #FF0000; z-index: 1; left: 287px; top: 130px; position: absolute;" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Formato de Email Incorrecto</asp:RegularExpressionValidator>
        <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmailCP" ErrorMessage="No has introducido Email" style="color: #FF0000; z-index: 1; left: 287px; top: 130px; position: absolute;">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 90px; top: 113px; position: absolute; height: 422px; width: 161px; font-weight: 700">
            Introduce Email:<br />
            <asp:TextBox ID="txtEmailCP" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnCompEmail" runat="server" Text="Comprobar Email" Width="150px" />
            <br />
            <br />
            <asp:Label ID="lblPreSec" runat="server" Visible="False">Pregunta Secreta: </asp:Label>
            <br />
            <asp:Label ID="lblPregunta" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblResSec" runat="server" Visible="False">Respuesta Secreta:</asp:Label>
            <br />
            <asp:TextBox ID="txtRespuestaCP" runat="server" Visible="False"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnCompRes" runat="server" Text="Comprobar Respuesta" Visible="False" Width="150px" />
            <br />
            <br />
            <asp:Label ID="lblPass1" runat="server" Visible="False">Nuevo Password:</asp:Label>
            <br />
            <asp:TextBox ID="txtPass1" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblPass2" runat="server" Visible="False">Repite Password:</asp:Label>
            <br />
            <asp:TextBox ID="txtPass2" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnCambiar" runat="server" Text="Cambiar Password" Visible="False" Width="150px" />
            <br />
            <br />
            <br />
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="validResSec" runat="server" ControlToValidate="txtRespuestaCP" ErrorMessage="No has introducido Respuesta Secreta" style="color: #FF0000; z-index: 1; left: 286px; top: 280px; position: absolute;" Visible="False">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:RequiredFieldValidator ID="validPass1" runat="server" ControlToValidate="txtPass1" ErrorMessage="No has introducido Password" style="color: #FF0000; z-index: 1; left: 287px; top: 377px; position: absolute;" Visible="False">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:RequiredFieldValidator ID="validPass2" runat="server" ControlToValidate="txtPass2" ErrorMessage="No has introducido Repeticion de Password" style="color: #FF0000; z-index: 1; left: 287px; top: 433px; position: absolute; right: 567px;" Visible="False">* Campo Obligatorio</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass1" ControlToValidate="txtPass2" ErrorMessage="La repeticion del Password es incorrecta" style="color: #FF0000; z-index: 1; left: 287px; top: 433px; position: absolute;">* El Password no coincide con el anterior</asp:CompareValidator>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
        <br />
    
        <br />
            <asp:Label ID="lblExito" runat="server" style="font-weight: 700; font-size: large; color: #009900; z-index: 1; left: 105px; top: 565px; position: absolute;" Visible="False"></asp:Label>
            <asp:Label ID="lblError" runat="server" style="font-size: x-large; color: #FF0000; z-index: 1; left: 104px; top: 586px; position: absolute;"></asp:Label>
    
    </div>
    </form>
</body>
</html>
