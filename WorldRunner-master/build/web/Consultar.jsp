<%@ page language="java" %>
<%@ page import = "bean.Contacto"%> 
<%@ page import = "bean.ConsultaAgenda"%>
<%@ page import = "bean.Contacto2"%> 
<%@ page import = "bean.ConsultaAgenda2"%>
<%@ page import = "java.util.LinkedList"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>World Runners</title>
	<link rel="stylesheet" href="css/principal.css">
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
						<a href="Form-Modificar.jsp" title="">Modificar</a>
                                                <a href="Form-Eliminar.jsp">Borrar</a>
				</nav>
			</div>	
		</header>
		<main>
			<section class="presentacion">
				
                                    <h2>Usuarios registrados</h2>        
          <table border="1" align="center">
                <tr>
                <th>Usuario</th>
                <th>Password</th>
                <th>Correo</th>
                <th>Nombre</th>
                <th>Apellidop</th>
                <th>Apellidom</th>
                <th>CURP</th>
                <th>Año</th>
                <th>Mes</th>
                <th>Dia</th>
                <th>Direccion</th>
                <th>CP</th>
                <th>Telefono</th>
                
                </tr>           
                <%
                  
                    LinkedList<Contacto2> lista = ConsultaAgenda2.getContactos();
                    for (int i=0;i<lista.size();i++)
                    {
                       out.println("<tr>");
                       out.println("<td>"+lista.get(i).getUsuario()+"</td>");
                       out.println("<td>"+lista.get(i).getPassword()+"</td>");
                       out.println("<td>"+lista.get(i).getCorreo()+"</td>");
                       out.println("<td>"+lista.get(i).getNombre()+"</td>");
                       out.println("<td>"+lista.get(i).getApellidop()+"</td>");
                       out.println("<td>"+lista.get(i).getApellidom()+"</td>");
                       out.println("<td>"+lista.get(i).getCurp()+"</td>");
                       out.println("<td>"+lista.get(i).getYear()+"</td>");
                       out.println("<td>"+lista.get(i).getMonth()+"</td>");
                       out.println("<td>"+lista.get(i).getDay()+"</td>");
                       out.println("<td>"+lista.get(i).getDireccion()+"</td>");
                       out.println("<td>"+lista.get(i).getCp()+"</td>");
                       out.println("<td>"+lista.get(i).getTelefono()+"</td>");
                     
                       out.println("</tr>");
                    }
                    
           
                    %>
                
            </table>
                                        
				
				
			</section>
		</main>
	</div>
</body>
</html>
