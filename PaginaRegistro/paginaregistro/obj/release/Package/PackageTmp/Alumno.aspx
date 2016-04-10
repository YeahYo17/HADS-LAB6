<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumno.aspx.vb" Inherits="PaginaRegistro.Alumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


        .auto-style1 {
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 475px">
    
        <asp:Panel ID="Panel3" runat="server" Height="400px" style="text-align: center; background-color: #3366CC; z-index: 1; left: 21px; top: 34px; position: absolute; height: 400px; width: 178px;" Width="170px" BorderStyle="Inset">
            <br />
            <br />
            <strong>
            <asp:HyperLink ID="hlTareasGen" runat="server" NavigateUrl="~/TareasAlumno.aspx" style="text-align: left; color: #FFFFFF;">Tareas Genericas</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="hlTareasProp" runat="server" style="text-align: left; color: #FFFFFF;">Tareas Propias</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="hlGrupos" runat="server" style="text-align: left; color: #FFFFFF;">Grupos</asp:HyperLink>
            </strong>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" BorderStyle="Inset" HorizontalAlign="Center" style="z-index: 1; left: 218px; top: 34px; position: absolute; height: 400px; width: 729px; text-align: center; margin-top: 0px; background-color: #99CCFF">
            <strong><span class="auto-style1">
            <br style="z-index: 1; left: 364px; top: 0px; position: absolute" />
            <br />
            <br />
            Gestion Web de Tareas-Dedicacion<br />
            <br />
            Alumnos</span></strong></asp:Panel>
    
    </div>
    </form>
</body>
</html>
