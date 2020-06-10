<%@ page language="java" %>
<%@ page import = "bean.Contacto"%>
<%@ page import = "bean.ModificaAgenda"%>

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
						<a href="log.jsp" title="">Log-in</a>
				</nav>
			</div>	
		</header>
		<main>
			<section class="presentacion">
				<h1>Los datos se han actualizado correctamente</h1>
         <%
             ModificaAgenda objmodif=new ModificaAgenda();
            String nombre,apellidop,apellidom,correo,direccion,password,telefono;
            
            
            password=request.getParameter("password");%>
            <br><%
            correo=request.getParameter("correo");%>
            <br><%
            nombre=request.getParameter("nombre");%>
            <br><%
            apellidop=request.getParameter("apellidop");%>
            <br><%
            apellidom=request.getParameter("apellidom");%>
            <br><%
            direccion=request.getParameter("direccion");%>
            <br><%
            telefono=request.getParameter("telefono");%>
            <br><%
                        
            if (objmodif.modificarUsuario(nombre, apellidop, apellidom, telefono, correo, direccion,password)){
                out.println("Usuario actualizado correctamente");%>
            <br><%
                out.println(nombre=request.getParameter("nombre"));%>
            <br><%
                out.println(apellidop=request.getParameter("apellidop"));%>
            <br><%
                out.println(apellidom=request.getParameter("apellidom"));%>
            <br><%
                out.println(telefono=request.getParameter("telefono"));%>
            <br><%
                out.println(correo=request.getParameter("correo"));%>
            <br><%
                out.println(direccion=request.getParameter("direccion"));%>
            <br><%
                out.println(password=request.getParameter("password"));%>
            <br><%
            } else {
                out.println("Error en la actualización");
                
            }
 %>
                 
				</div>
				
			</section>
		</main>
	</div>

    </body>
</html>
