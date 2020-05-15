<%-- 
    Document   : log
    Created on : 24/04/2020, 07:42:21 PM
    Author     : lyeup
--%>

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
						<a href="index.html" title="">Inicio</a>
						<a href="registro.html" title="">Registro</a>
				</nav>
			</div>	
		</header>
		<main>
			<section class="presentacion">
				<div class="contenedor-formulario">
					<form action="loginprocess.jsp" method="get" accept-charset="utf-8">
						<img src="img/usuario (1).png" alt="" class="per">
						<h2>LOG-IN</h2>
						Correo Electronico:<br>
						<input type="text" name="correo" value="" placeholder="" class="intro"> <br><br>
						Contraseña:<br>
						<input type="password" name="password" value="" placeholder="" class="intro"><br><br>                  
						<input type="submit" name="proceso" value="Entrar" onclick="" class="button"></input>
					</form>
				</div>
				
			</section>
		</main>
	</div>
</body>
</html>
