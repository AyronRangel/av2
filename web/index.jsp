<%-- 
    Document   : index
    Created on : Nov 30, 2017, 8:21:50 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

        <title>Cadastrar Paciente</title>
    </head>
    <body>
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">Avaliação N2</a>
                <ul class="right hide-on-med-and-down">
                    <!--<li><a href="#">Navbar Link</a></li>-->
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <!--<li><a href="#">Navbar Link</a></li>-->
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        <div class="section no-pad-bot" id="index-banner">
            <div class="container">
                <br><br>
                <h3 class="header center blue-grey-text">Paciente</h3>
                <div class="row center">
                    <!--<h5 class="header col s12 light">Um jeito moderno de gerenciar o seu livro de receitas em qualquer lugar e a qualquer momento.</h5>-->
                </div>
                <div class="row center">

                </div>
                <br><br>

            </div>
        </div>
        <!-- ==============CONTEUDO------------------------>
        <div class="container">
            <div class="section">
                <div class="row">
                    <div class="col s15 m5">
                        <div class="icon-block">
                            <h5 class="center">Nova Paciente</h5>
                            <form method="post" action="cadPaciente.jsp">
                                <% PacienteControle controle = new PacienteControle();
                                    ConsultaControle consultaControle = new ConsultaControle();
                                    String id = request.getParameter("id");
                                    Paciente p = null;
                                    if (id != null) {
                                        p = controle.listarPacientePorId(new Long(id));
                                %>
                                <div class="input-field col s12">
                                    <input readonly value="<%=request.getParameter("id")%>" name="id" id="id" type="text" class="validate">
                                    <label for="id">Identificação</label>
                                </div>
                                <%}%>
                                <div class="input-field col s12">
                                    <input id="nome" name="nome" type="text" class="validate" value="<%=p != null ? p.getNome() : ""%>" requeired="">
                                    <label for="nome">Nome</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="endereco" name="endereco" type="text" class="validate" value="<%=p != null ? p.getEndereço() : ""%>" requeired="">
                                    <label for="endereco">Endereço</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="celular" name="celular" type="number" class="validate" value="<%=p != null ? p.getCelular() : ""%>" requeired="">
                                    <label for="celular">Celular</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="email" name="email" type="email" class="validate" value="<%=p != null ? p.getEmail() : ""%>" requeired="">
                                    <label for="email">Email</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="tipoSangue" name="tipoSangue" type="text" class="validate" value="<%=p != null ? p.getTipoSangue() : ""%>" requeired="">Tipo Sanguineos: A, B, AB ou O
                                    <label for="tipoSangue">Tipo Sanguineo</label>
                                </div>
                                <div class="input-field col s12">
                                    <input id="fatorRH" name="fatorRH" type="text" class="validate" value="<%=p != null ? p.getFatorRH() : ""%>" requeired="">
                                    <label for="fatorRH">Fator RH</label> Fatores RH: + ou -
                                </div>
                        </div>
                        <div class="input-field col s12">


                            <select required="true" id="categoria" name="consulta" class="validate">
                                <option value="" disabled selected>Adicione Dados da Consulta</option>
                                <%  List<Consulta> consultas = consultaControle.listarConsultas();
                                    for (Consulta c : consultas) {%>
                                <option value="<%=c.getId()%>" selected="<%=p != null ? p.getConsulta().getId() == c.getId() : "false"%>"><%=c.getData()%></option>                            
                                <%}%>
                            </select>
                            <label for="consulta">Consulta</label>
                        </div>
                        <div class="input col s12">
                            <div class="input col s12">
                                <button class="btn waves-effect waves-light" type="submit" name="gravar">Cadastrar
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

                            <h5 class="center">Meus Pacientes</h5>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Endereço</th>
                                        <th>Celular</th>
                                        <th>Email</th>
                                        <th>Tipo Sangue</th>
                                        <th>RH</th>
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
                                    <% }
                                    %>
                                </tbody>
                            </table>


                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- ==============CONTEUDO------------------------>
        <footer class="page-footer blue">
            <div class="container">

            </div>
            <div class="footer-copyright">
                <div class="container">
                    Desenvolvimento de Sistemas II
                </div>
            </div>
        </footer>


        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>
    </body>
</html>
