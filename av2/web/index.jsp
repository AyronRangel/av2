<%-- 
    Document   : index
    Created on : Nov 30, 2017, 8:21:50 PM
    Author     : user
--%>

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

                            <h5 class="center">Novo Paciente</h5>

                            <form method="POST" action="cadPaciente.jsp">
                                <%
                                    PacienteControle controle = new PacienteControle();
                                    String id = request.getParameter("id");
                                    Paciente u = null;
                                    if (id != null) {
                                        u = controle.listarPacientePorId(new Long(id));
                                %>

                                <div class="input-field col s12">
                                    <input readonly value="<%=request.getParameter(id)%>" name="id" id="id" type="text" class="validate">
                                    <label for="id">Identificação</label>
                                </div>
                                <%}%>
                                <div class="input-field col s12">
                                    <input id="nome" name="nome" type="text" class="validate" value="<%=u != null ? u.getNome() : ""%>">
                                    <label for="nome">Nome Completo</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="endereco" name="endereco" type="text" class="validate" value="<%=u != null ? u.getEndereço() : ""%>">
                                    <label for="endereco">Endereço</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="celular" name="celular" class="materialize-textarea" value="<%=u != null ? u.getCelular() : ""%>" type="text">
                                    <label for="celular">Celular</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="email" name="email" class="materialize-textarea" value="<%=u != null ? u.getEmail(): ""%>" type="email">
                                    <label for="email">Email</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="tipoSangue" name="tipoSangue" type="text" class="validate" value="<%=u != null ? u.getTipoSangue() : ""%>" requeired="">Tipo Sanguineos: A, B, AB ou O
                                    <label for="tipoSangue">Tipo Sanguineo</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="fatorRH" name="fatorRH" type="text" class="validate" value="<%=u != null ? u.getFatorRH() : ""%>" requeired="">
                                    <label for="fatorRH">Fator RH</label> Fatores RH: + ou -
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

                            <h5 class="center">Pacientes Cadastrados</h5>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Endereço</th>
                                        <th>Celular</th>
                                        <th>Email</th>
                                        <th>Sangue</th>
                                        <th>Fator RH</th>
                                    </tr>
                                </thead>

                                <tbody> 
                                    <%
                                        List pacientes = controle.listarPacientes();
                                        for (Object o : pacientes) {
                                            Paciente paciente = (Paciente) o;

                                    %>
                                    <tr>
                                        <td><%=paciente.getNome()%></td>
                                        <td><%=paciente.getEndereço()%></td>
                                        <td><%=paciente.getCelular()%></td>
                                        <td><%=paciente.getEmail()%></td>
                                        <td><%=paciente.getTipoSangue()%></td>
                                        <td><%=paciente.getFatorRH()%></td>
                                        <td><a href="#"><i class="material-icons right">delete</i></a>
                                            <a href="index.jsp?id=<%=paciente.getId()%>"><i class="material-icons right">create</i></a></td>
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
