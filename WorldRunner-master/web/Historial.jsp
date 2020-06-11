<%-- 
    Document   : Historial
    Created on : 11/06/2020, 12:47:34 AM
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
                                <form action="ConfirmarCompra.jsp">
                                    <input type="submit" value="Carrito de compras" class="navForm">
                                    <%out.print("<input hidden type=\"text\" id=\"Correo\" name=\"Correo\" value=\"" + request.getParameter("Correo") + "\" >");%>
                                </form>   
                                <form action="Tienda.jsp">
                                    <input type="submit" value="Tienda" class="navForm">
                                    <%out.print("<input hidden type=\"text\" id=\"Correo\" name=\"Correo\" value=\"" + request.getParameter("Correo") + "\" >");%>
                                </form>   
                            </nav>
			</div>	
		</header>
		<main>
            <section class="presentacion">
                <h2>
                    Historial de compras
                </h2>
                <div class="contenedor-tienda">
                    <%
                        String[] historialDeCompra = new Tienda.ManejoDeProductos().historialDeCompras(request.getParameter("Correo"));
                        if(historialDeCompra != null){
                            for (int i = 0; i < historialDeCompra.length; i++) {
                                if (historialDeCompra[i] != null) {
                                    out.print(historialDeCompra[i]);
                                }
                            }
                        }
                    %>
                    <form action="Tienda.jsp">
                        <input type="submit" value="Tienda" class="navForm">
                        <%out.print("<input hidden type=\"text\" id=\"Correo\" name=\"Correo\" value=\"" + request.getParameter("Correo") + "\" >");%>
                    </form>
                </div>                
            </section>
        </main>
	</div>
</body>
</html>
