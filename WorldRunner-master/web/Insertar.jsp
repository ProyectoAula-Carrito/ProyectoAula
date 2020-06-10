<%@page import="Cliente.ClienteAc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%@page import="Cliente.Cliente" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>World Runners</title>
	<link rel="stylesheet" href="css/estilo.css">
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
				
 <%
        String correo=request.getParameter("correo");
        String nombres=request.getParameter("names");
        String appat=request.getParameter("Appat");
        String apmat=request.getParameter("Apmat");
        int dia=Integer.parseInt(request.getParameter("dia"));
        int mes=Integer.parseInt(request.getParameter("mes"));
        int año=Integer.parseInt(request.getParameter("year"));
        String diav=String.valueOf(dia);
        String mesv=String.valueOf(mes);
        String añov=String.valueOf(año);
        String sexo=request.getParameter("sex");
        String password=request.getParameter("password");
        String confirm=request.getParameter("confirm");
        if(correo.matches("^(^[a-zA-Z-0-9]+@{1}[a-z]+(([.](com|web|org|gob|ipn)){1}([.](jp|es|mx))?){1}$){1}") && nombres.matches("^[A-Za-z\\s]+${1,44}") && appat.matches("^[A-Za-z\\s]+${1,44}")
                && apmat.matches("^[A-Za-z\\s]+${1,44}") && diav.matches("^[0-9]+${1,3}+$") && mesv.matches("^[0-9]+${1,3}+$") && añov.matches("^[0-9]+${1,5}+$") && sexo.matches("^[A-Za-z\\s]+${1,44}")
                && password.matches("^[a-zA-Z0-9]+${1,44}") && confirm.matches("^[a-zA-Z0-9]+${1,44}")){
        Cliente cl=new Cliente();
        cl.setCorreo(correo);cl.setNombres(nombres);cl.setAppat(appat);cl.setApmat(apmat);cl.setSexo(sexo);cl.setDia(dia);cl.setMes(mes);cl.setYear(año);cl.setPassword(password);
        boolean estatus=ClienteAc.Register(cl);
        
        if (estatus) {%>
        <div class="contenedor-presentacion">
					<div class="contenedor-correcto">
                                            <h1>Los registros fueron insertados correctamente</h1>
						<h2>"La operacion se ha realizado exitosamente"</h2>
					</div>	
        </div>
<%               
        }else{%>
        <div class="contenedor-presentacion">
					<div class="contenedor-error">
						<h2>"Se produjo un error al realizar la operacion"</h2>
					</div>	
            </div>
            <%
        }}else{%>
        <div class="contenedor-presentacion">
					<div class="contenedor-error">
						<h2>"Se produjo un error al realizar la operacion"</h2>
					</div>	
            </div>
<%
}

 %>
  <br><br>
                 
				
				
			</section>
		</main>
	</div>
</body>
</html>
