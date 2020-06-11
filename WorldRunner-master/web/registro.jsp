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
					<form action="Insertar.jsp"  method="post" accept-charset="utf-8" name="formulario">
						<img src="img/usuario (1).png" alt="" class="per">
						<h2>REGISTRO</h2>
						Correo:<br>
                                                <input type="text" name="correo" value="" placeholder="" class="intro" autocomplete="off"> <br><br>
						Nombre(s):<br>
						<input type="text" name="names" value="" placeholder="" class="intro" autocomplete="off"><br><br>
						Apellido paterno:<br>
						<input type="text" name="Appat" value="" placeholder="" class="intro" autocomplete="off"><br><br>
                                                Apellido materno:<br>
                                                <input type="text" name="Apmat" value="" placeholder="" class="intro" autocomplete="off"><br><br>
                                                Dia de nacimiento: <br>
						<input type="text" name="dia" value="" placeholder="" class="intro" autocomplete="off"><br><br>
						<br>
						Mes de nacimiento: <br>
						<input type="text" name="mes" value="" placeholder="" class="intro" autocomplete="off"><br><br>
						Año de nacimiento: <br>
						<input type="text" name="year" value="" placeholder="" class="intro" autocomplete="off"><br><br>
						Sexo: <br>
                                                <input type="radio" name="sex" value="H">Hombre
                                                <input type="radio" name="sex" value="M">Mujer<br>
						Contraseña: <br>
						<input type="text" name="password" value="" placeholder="" class="intro" autocomplete="off"><br><br>
						Confirmar contraseña: <br>
						<input type="text" name="confirm" value="" placeholder="" class="intro" ><br><br>
                                                <input type="submit" name="proceso" value="Entrar" onclick="validaregister()" class="button">
                                                <input type="hidden" name="vajs" value="0">
					</form>
				</div>
				
			</section>
		</main>
	</div>
</body>
</html>
