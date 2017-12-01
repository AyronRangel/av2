<%-- 
    Document   : cadConsulta
    Created on : Nov 30, 2017, 10:03:05 PM
    Author     : user
--%>

<%@page import="modelo.Consulta"%>
<%@page import="controle.ConsultaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ConsultaControle controle = new ConsultaControle();
            Consulta consulta = new Consulta();
                String id = request.getParameter("id");
                System.out.println("id:" + id);
                if (id != null) {
                   consulta.setId(new Long(id));
                }
                consulta.setData(request.getParameter("data"));
                consulta.setRelatos(request.getParameter("relatos"));
                consulta.setMedicoes(request.getParameter("medicoes"));
                consulta.setExames(request.getParameter("exames"));
                controle.gravar(consulta);
                response.sendRedirect("consulta.jsp");
            %>
    </body>
</html>
