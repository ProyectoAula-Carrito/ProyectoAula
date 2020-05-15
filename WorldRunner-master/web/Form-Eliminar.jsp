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
						<a href="Consulta.jsp" title="">Consultar</a>
						<a href="registro.html" title=""></a>
				</nav>
			</div>	
		</header>
		<main>
			<section class="presentacion">
				<div class="contenedor-formulario">
					<h1>Eliminar</h1>
        
                                        <form action="Eliminar.jsp" method="post">
                                            Correo: <input type="text" name="correo" class="intro"/><br/><br/>
                                            <input type="submit" value="Eliminar" class="button"/>
                                        </form>
				</div>
				
			</section>
		</main>
	</div>
        
        
        
    </body>
</html>
