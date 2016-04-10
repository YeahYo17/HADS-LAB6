<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarPassword.aspx.vb" Inherits="PaginaRegistro.CambiarPassword" %>

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
        Introduce Email:<br />
        <asp:TextBox ID="txtEmailCP" runat="server"></asp:TextBox>
&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmailCP" ErrorMessage="No has introducido Email" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailCP" ErrorMessage="El formato de Email introducido es incorrecto" style="color: #FF0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Formato de Email Incorrecto</asp:RegularExpressionValidator>
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
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="validResSec" runat="server" ControlToValidate="txtRespuestaCP" ErrorMessage="No has introducido Respuesta Secreta" style="color: #FF0000" Visible="False">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnCompRes" runat="server" Text="Comprobar Respuesta" Visible="False" Width="150px" />
        <br />
        <br />
        <asp:Label ID="lblPass1" runat="server" Visible="False">Nuevo Password:</asp:Label>
        <br />
        <asp:TextBox ID="txtPass1" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
        <asp:RequiredFieldValidator ID="validPass1" runat="server" ControlToValidate="txtPass1" ErrorMessage="No has introducido Password" style="color: #FF0000" Visible="False">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblPass2" runat="server" Visible="False">Repite Password:</asp:Label>
        <br />
        <asp:TextBox ID="txtPass2" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
        <asp:RequiredFieldValidator ID="validPass2" runat="server" ControlToValidate="txtPass2" ErrorMessage="No has introducido Repeticion de Password" style="color: #FF0000" Visible="False">* Campo Obligatorio</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass1" ControlToValidate="txtPass2" ErrorMessage="La repeticion del Password es incorrecta" style="color: #FF0000">* El Password no coincide con el anterior</asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="btnCambiar" runat="server" Text="Cambiar Password" Visible="False" Width="150px" />
        <br />
        <br />
        <asp:Label ID="lblExito" runat="server" style="font-weight: 700; font-size: large; color: #009900" Visible="False"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
