<%-- 
    Document   : cadPaciente
    Created on : Nov 30, 2017, 8:36:20 PM
    Author     : user
--%>

<%@page import="modelo.Consulta"%>
<%@page import="controle.ConsultaControle"%>
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
            ConsultaControle consultaControle = new ConsultaControle();
            Consulta consulta = new Consulta();
            
            PacienteControle pacienteControle = new PacienteControle();
            Paciente paciente = new Paciente();
            
            String id = request.getParameter("id");
            System.out.println("id:" + id);
            if (id != null) {
                consulta.setId(new Long(id));
            }
            consulta.setData(request.getParameter("data"));
            consulta.setRelatos(request.getParameter("relatos"));
            consulta.setMedicoes(request.getParameter("medicoes"));
            consulta.setExames(request.getParameter("exames"));

            String strPaciente = request.getParameter("paciente");
            Paciente p = (Paciente) pacienteControle.listarPacientePorId(Long.parseLong(strPaciente));
            consulta.setPaciente(p);
            
            consultaControle.gravar(consulta);
            response.sendRedirect("consulta.jsp");
        %>
    </body>
</html>

</body>
</html>
