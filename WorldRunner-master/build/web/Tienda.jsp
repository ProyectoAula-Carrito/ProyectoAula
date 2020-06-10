<%-- 
    Document   : Tienda
    Created on : 9/06/2020, 04:30:05 PM
    Author     : crist
--%>

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
                                <a href="CompletarCompra.jsp" title="">Carrito de compras</a>
                                <a href="Historial.jsp">Historial</a>
                            </nav>
			</div>	
		</header>
		<main>
            <section class="presentacion">
                <script type="text/javascript">
                    function agregar(id) {
                        cantidad = parseInt(document.getElementById(id).value);
                        if (cantidad > 0){
                            cantidad = cantidad - 1;
                            document.getElementById(id).value = cantidad;
                            alert("Se agrego el producto");
                        }
                        else{
                            alert("Se acabo el producto");   
                        }
                    }
                </script>
                <h2>
                    Playeras
                </h2>
                <div class="contenedor-tienda">
                    <%
                        String[] productosAMostrar = new Tienda.TiendaCargarProductos().productosEnBD();
                        if(productosAMostrar != null){
                            for (int i = 0; i < productosAMostrar.length; i++) {
                                out.print(productosAMostrar[i]);
                            }
                        }
                    %>
                </div>                
            </section>
        </main>
	</div>
</body>
</html>
