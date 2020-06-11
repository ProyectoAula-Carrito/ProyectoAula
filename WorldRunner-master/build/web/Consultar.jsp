<%@page import="Cliente.ClienteAc"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%@page import="Cliente.Cliente" %>
<%@ page language="java" %>
<%@ page import = "java.util.LinkedList"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>World Runners</title>
	<link rel="stylesheet" href="css/registro.css">
	<link rel="icon" href="img/funcionamiento.png">
	<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
</head>
<body>
	<script src="js/validar.js" type="text/javascript" charset="utf-8" async defer></script>
	<div class="contenedor">
		<header class="encabezado">
			<div class="im">
				<img src="img/funcionamiento.png" alt="LOGO" class="logo">
				<h1>WORLD RUNNERS</h1>	
			</div>
			<div class="nave">
                            <nav class="">	
                                <a href="index.jsp" title="">Inicio</a>
                                <a href="CompletarCompra.jsp" title="">Productos</a>
                                <a href="Consultar.jsp">Clientes</a>
                            </nav>
			</div>	
		</header>
		<main>
            <section class="presentacion">
                   <%
                   List<Cliente> datos=ClienteAc.Consultar();
                   %>
                   <table>
                       <tr>
                           <th>Correo</th>
                           <th>Nombre</th>
                           <th>Fecha de nacimiento</th>
                           <th>Sexo</th>
                       </tr>         
                <%
                    for (Cliente cl:datos) {
                            %>
                            <tr>
                            <td><% out.println(cl.getCorreo()); %></td>
                            <td><% out.println(cl.getNombres()+" "+cl.getAppat()+" "+cl.getApmat()); %></td>
                            <td><% out.println(cl.getDia()+"/"+cl.getMes()+"/"+cl.getYear()); %></td>
                            <td><% out.println(cl.getSexo()); %></td>
                            </tr>
                       <%
                        }
                   %> 
                   </table>  
            </section>
        </main>
	</div>
</body>
</html>
