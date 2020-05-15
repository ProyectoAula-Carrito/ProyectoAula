<%@ page language="java" %>
<%@ page import = "bean.Contacto"%> 
<%@ page import = "bean.InsertaAgenda"%> 
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
				<h1>Los registros fueron insertados correctamente</h1>
 <%
            InsertaAgenda objcontacto=new InsertaAgenda();
            String usuario,password,correo,nombre,apellidop,apellidom,curp,direccion,cp;
            String telefono,year,month,day;
            
            usuario=request.getParameter("usuario");
            password=request.getParameter("password");
            correo=request.getParameter("correo");
            nombre=request.getParameter("nombre");
            apellidop=request.getParameter("apellidop");
            apellidom=request.getParameter("apellidom");
            curp=request.getParameter("curp");
            direccion=request.getParameter("direccion");
            cp=request.getParameter("cp");
            telefono=request.getParameter("telefono");
            year=request.getParameter("year");
            month=request.getParameter("month");
            day=request.getParameter("day");

            
            if (objcontacto.agregarUsuario(usuario,password,correo,nombre,apellidop,apellidom,curp,year,month,day,direccion,cp,telefono)){
                out.println(usuario=request.getParameter("usuario"));%>
                <br>
                <%                
                out.println(password=request.getParameter("password"));%>
                <br>
                <%
                out.println(correo=request.getParameter("correo"));%>
                <br>
                <%
                out.println(nombre=request.getParameter("nombre"));%>
                <br>
                <%
                out.println(apellidop=request.getParameter("apellidop"));%>
                <br>
                <%
                out.println(apellidom=request.getParameter("apellidom"));%>
                <br>
                <%
                out.println(curp=request.getParameter("curp"));%>
                <br>
                <%
                out.println(direccion=request.getParameter("direccion"));%>
                <br>
                <%
                out.println(cp=request.getParameter("cp"));%>
                <br>
                <%
                out.println(telefono=request.getParameter("telefono"));%>
                <br>
                <%
                out.println(year=request.getParameter("year"));%>
                <br>
                <%
                out.println(month=request.getParameter("month"));%>
                <br>
                <%
                out.println(day=request.getParameter("day"));
            } else {
                out.println("Error en el registro");
                
            }
 %>
  <br><br>
                 
				</div>
				
			</section>
		</main>
	</div>
</body>
</html>
