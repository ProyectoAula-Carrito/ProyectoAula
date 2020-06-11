<%-- 
    Document   : CompraCompleta
    Created on : 9/06/2020, 08:29:15 PM
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
                    Ordenes
                </h2>
                <div class="contenedor-tienda">
        <%
            boolean compraCompleta = new Tienda.ManejoDeProductos().compraRealizada(request.getParameter("OrdenesH"), request.getParameter("Direccion"), request.getParameter("metodoDePago"), request.getParameter("Correo"));
            if (compraCompleta) {
                %>
                <script type="text/javascript">
                    localStorage.clear();
                </script>
                <h1>
                    Compra completa
                </h1>
                <p>
                    Su orden llegara en un par de dias
                </p>
                <%
            }
            else{

                %>
                <h1>
                    Compra fallida
                </h1>
                <p>
                    Su orden no pudo ser procesada, compruebe que los datos sean correctos
                </p>
                <%
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
