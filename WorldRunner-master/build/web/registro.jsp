<%-- 
    Document   : registro
    Created on : 20/04/2020, 11:34:02 PM
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
						<a href="index.jsp" title="">Inicio</a>
						<a href="log.jsp" title="">Log-in</a>
				</nav>
			</div>	
		</header>
		<main>
			<section class="presentacion">
				<div class="contenedor-formulario">
					<form action="Insertar.jsp" method="post">
						<img src="img/usuario (1).png" alt="" class="per">
						<h2>REGISTRO</h2>
						Usuario:<br>
						<input type="text" name="usuario" value="" placeholder="" class="intro"> <br><br>
						Contraseña:<br>
						<input type="password" name="password" value="" placeholder="" class="intro"><br><br>
						Confirmar contraseña:<br>
						<input type="password" name="confirm" value="" placeholder="" class="intro"><br><br>
                                                Correo electronico:<br>
                                                <input type="text" name="correo" value="" placeholder="" class="intro"><br><br>
                                                Nombre <br>
						<input type="text" name="nombre" value="" placeholder="" class="intro"><br><br>
						Apellido paterno<br>
						<input type="text" name="apellidop" value="" placeholder="" class="intro"><br><br>
						Apellido materno <br>
						<input type="text" name="apellidom" value="" placeholder="" class="intro"><br><br>
						CURP <br>
						<input type="text" name="curp" value="" placeholder="" class="intro"><br><br>
						Fecha de nacimiento <br>
						<input type="text" name="year" value="" placeholder="" class="intro">
						<input type="text" name="month" value="" placeholder="" class="intro">
						<input type="text" name="day" value="" placeholder="" class="intro"><<br><br>
						Direccion <br>
						<input type="text" name="direccion" value="" placeholder="" class="intro"><br><br>
						CP <br>
						<input type="text" name="cp" value="" placeholder="" class="intro"><br><br>
						Telefono de contacto<br>
						<input type="text" name="telefono" value="" placeholder="" class="intro"><br><br>
						<input type="submit" value="Registrar" onclick="" class="button"></input>
					</form>
				</div>
				
			</section>
		</main>
	</div>
</body>
</html>
