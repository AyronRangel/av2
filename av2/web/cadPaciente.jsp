<%-- 
    Document   : cadPaciente
    Created on : Nov 30, 2017, 8:36:20 PM
    Author     : user
--%>

<%@page import="modelo.Paciente"%>
<%@page import="controle.PacienteControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            PacienteControle controle = new PacienteControle();
            Paciente paciente = new Paciente();
            String id = request.getParameter("id");
            System.out.println("id:" + id);
            if (id != null) {
                paciente.setId(new Long(id));
            }
            paciente.setNome(request.getParameter("nome"));
            paciente.setEndereço(request.getParameter("endereco"));
            paciente.setCelular(request.getParameter("celular"));
            paciente.setEmail(request.getParameter("email"));
            paciente.setTipoSangue(request.getParameter("tipoSangue"));
            paciente.setFatorRH(request.getParameter("fatorRH"));
            controle.gravar(paciente);
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>

</body>
</html>
