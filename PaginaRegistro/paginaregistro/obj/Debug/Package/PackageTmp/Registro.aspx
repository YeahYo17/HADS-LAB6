<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="PaginaRegistro.Registro" %>

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
        Email:<br />
        <asp:TextBox ID="txtEmailReg" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmailReg" ErrorMessage="No se ha introducido Email" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="validacionEmail" runat="server" ErrorMessage="Formato de email incorrecto" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="position: relative; color: #FF0000" ControlToValidate="txtEmailReg">* Formato de email incorrecto</asp:RegularExpressionValidator>
        <br />
        <br />
        Nombre:<br />
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNombre" ErrorMessage="No se ha introducido Nombre" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        Primer Apellido:<br />
        <asp:TextBox ID="txtApellido1" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtApellido1" ErrorMessage="No se ha introducido Primer Apellido" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        Segundo Apellido:<br />
        <asp:TextBox ID="txtApellido2" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtApellido2" ErrorMessage="No se ha introducido Segundo Apellido" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        DNI:<br />
        <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDni" ErrorMessage="No se ha introducido DNI" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDni" ErrorMessage="El formato del DNI es incorrecto" style="color: #FF0000" ValidationExpression="\d{8}[a-zA-Z]">* El DNI introducido es incorrecto</asp:RegularExpressionValidator>
        <br />
        <br />
        Password:<br />
        <asp:TextBox ID="txtPassReg" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPassReg" ErrorMessage="No se ha introducido Password" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        Repite Password:<br />
        <asp:TextBox ID="txtRepPass" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRepPass" ErrorMessage="No se ha introducido Repeticion de Password" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassReg" ControlToValidate="txtRepPass" ErrorMessage="La Repeticion del Password es incorrecta" style="color: #FF0000">* No coincide con el Password introducido</asp:CompareValidator>
        <br />
        <br />
        Pregunta Secreta:<br />
        <asp:TextBox ID="txtPregunta" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPregunta" ErrorMessage="No se ha introducido Pregunta Secreta" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        Respuesta Secreta:<br />
        <asp:TextBox ID="txtRespuesta" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtRespuesta" ErrorMessage="No se ha introducido Respuesta Secreta" style="color: #FF0000">* Campo Obligatorio</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Width="130px" />
        <br />
        <br />
        <asp:ValidationSummary ID="resumenValidacion" runat="server" style="color: #FF0000" />
        <br />
        <asp:Label ID="lblEnlace" runat="server" style="font-weight: 700; text-decoration: underline" Text="Para confirmar el registro haga click en el siguiente enlace:" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="hlConfirmar" runat="server" Visible="False">[hlConfirmar]</asp:HyperLink>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
