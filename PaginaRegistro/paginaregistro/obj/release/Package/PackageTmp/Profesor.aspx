<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="PaginaRegistro.Profesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 492px;
        }
        .auto-style1 {
            font-size: xx-large;
        }
    </style>
</head>
<body style="height: 500px">
    <form id="form1" runat="server">
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="400px" style="text-align: center; background-color: #3366CC; z-index: 1; left: 21px; top: 34px; position: absolute; height: 400px; width: 178px;" Width="170px" BorderStyle="Inset">
            <strong style="position: relative">
            <br />
            <br />
            <asp:HyperLink ID="hlAsig" runat="server" style="text-align: left; color: #FFFFFF;">Asignaturas</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="hlTareas" runat="server" NavigateUrl="~/TareasProfesor.aspx" style="text-align: left; color: #FFFFFF;">Tareas</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="hlGrupos" runat="server" style="text-align: left; color: #FFFFFF;">Grupos</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="hlImpXMLDoc" runat="server" NavigateUrl="~/InsertarTareaXMLDocument.aspx" style="text-align: left; color: #FFFFFF;">Importar y, XMLDocument</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="hlExp" runat="server" NavigateUrl="~/Exportar.aspx" style="text-align: left; color: #FFFFFF;">Exportar</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="hlImpDS" runat="server" NavigateUrl="~/InsertarTareaDataSet.aspx" style="text-align: left; color: #FFFFFF;">Importar y, DataSet</asp:HyperLink>
            </strong>
        </asp:Panel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Panel ID="Panel2" runat="server" BorderStyle="Inset" HorizontalAlign="Center" style="z-index: 1; left: 218px; top: 34px; position: absolute; height: 400px; width: 729px; text-align: center; margin-top: 0px; background-color: #99CCFF">
            <strong><span class="auto-style1">
            <br style="z-index: 1; left: 364px; top: 0px; position: absolute" />
            <br />
            <br />
            Gestion Web de Tareas-Dedicacion<br />
            <br />
            Profesores</span></strong></asp:Panel>
    </form>
</body>
</html>
