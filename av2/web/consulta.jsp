<%-- 
    Document   : consulta
    Created on : Nov 30, 2017, 9:01:30 PM
    Author     : user
--%>

<%@page import="modelo.Consulta"%>
<%@page import="controle.ConsultaControle"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Paciente"%>
<%@page import="controle.PacienteControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="shared/head.html" %>

        <title>Avaliação N2</title>
    </head>
    <body>
        <%@include file="shared/navbar.html" %>
        <%@include file="shared/banner.html" %>
        <div class="container">
            <div class="section">     
                <div class="row">
                    <div class="col s15 m5">
                        <div class="icon-block">

                            <h5 class="center">Nova Consulta</h5>

                            <form method="POST" action="cadConsulta.jsp">
                                <%
                                    ConsultaControle controle = new ConsultaControle();
                                    PacienteControle pacienteControle = new PacienteControle();
                                    String id = request.getParameter("id");
                                    Consulta u = null;
                                    if (id != null) {
                                        u = controle.listarConsultaPorId(new Long(id));
                                %>

                                <div class="input-field col s12">
                                    <input readonly value="<%=request.getParameter(id)%>" name="id" id="id" type="text" class="validate">
                                    <label for="id">Identificação</label>
                                </div>
                                <%}%>
                                <<div class="input-field col s12">
                                    <input id="data" name="data" class="datepicker picker__input" type="text" value="<%=u != null ? u.getData() : ""%>">
                                    <label for="data">Data da Consulta</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="relatos" name="relatos" type="text" class="validate" value="<%=u != null ? u.getRelatos() : ""%>">
                                    <label for="relatos">Relatos do Paciente</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="medicoes" name="medicoes" class="materialize-textarea" value="<%=u != null ? u.getMedicoes() : ""%>" type="text">
                                    <label for="medicoes">Medições Pescritas</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="exames" name="exames" type="text" class="validate" value="<%=u != null ? u.getExames() : ""%>" requeired="">
                                    <label for="exames">Exames Solicitados</label>
                                </div>
                                <div class="input-field col s12">
                                    <select id="paciente" name="paciente">
                                        <option value="" disabled selected>   Selecione um Paciente</option>
                                        <%
                                            List pacientes = pacienteControle.listarPacientes();
                                            for (Object e1 : pacientes) {
                                                Paciente paciente = (Paciente) e1;
                                        %>
                                        <option value="<%=paciente.getId()%>"> <%=paciente.getNome()%> | <%=paciente.getTipoSangue()%> <%=paciente.getFatorRH()%></option>
                                        <%}%>
                                    </select>
                                    <label for="paciente">Paciente</label>
                                </div>
                                <div class="input col s12">
                                    <button class="btn waves-effect waves-light" type="submit" name="cadastrar">Cadastrar
                                        <i class="material-icons right">add</i>
                                    </button>
                                    <button class="btn waves-effect waves-light" type="reset" name="limpar">Limpar
                                        <i class="material-icons right">clear</i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="col s12 m6">
                        <div class="icon-block">

                            <h5 class="center">Consultas Cadastradas</h5>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Data</th>
                                        <th>Realtos</th>
                                        <th>Mediçoes</th>
                                        <th>Exames</th>
                                        <th>Paciente</th>
                                    </tr>
                                </thead>

                                <tbody> 
                                    <%
                                        List consultas = controle.listarConsultas();
                                        for (Object o : consultas) {
                                            Consulta consulta = (Consulta) o;

                                    %>
                                    <tr>
                                        <td><%=consulta.getData()%></td>
                                        <td><%=consulta.getRelatos()%></td>
                                        <td><%=consulta.getMedicoes()%></td>
                                        <td><%=consulta.getExames()%></td>
                                        <td><%=consulta.getPaciente().getNome()%></td>
                                        <td><a href="#"><i class="material-icons right">delete</i></a>
                                            <a href="consulta.jsp?id=<%=consulta.getId()%>"><i class="material-icons right">create</i></a></td>
                                    </tr>  
                                    <%                                        }
                                    %>
                                </tbody>
                            </table>


                        </div>
                    </div>


                </div>

            </div>
            <br><br>
        </div>
        <%@include file="shared/footer.html" %>  
    </body>
</html>
