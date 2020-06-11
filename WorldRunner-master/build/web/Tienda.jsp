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
                                <form action="ConfirmarCompra.jsp">
                                    <input type="submit" value="Carrito de compras" class="navForm">
                                    <%out.print("<input hidden type=\"text\" id=\"Correo\" name=\"Correo\" value=\"" + request.getParameter("Correo") + "\" >");%>
                                </form>   
                                <form action="Historial.jsp">
                                    <input type="submit" value="Historial" class="navForm">
                                    <%out.print("<input hidden type=\"text\" id=\"Correo\" name=\"Correo\" value=\"" + request.getParameter("Correo") + "\" >");%>
                                </form>   
                            </nav>
			</div>	
		</header>
		<main>
            <section class="presentacion">
                <script type="text/javascript">
                    function limpiarCC(){
                        localStorage.clear();
                        alert("Se limpio el carrito de compras");
                        location.href='Tienda.jsp';
                    }
                    
                    function agregar(id, nombre, talla, precio) {
                        cantidadPrevia = parseInt(localStorage.getItem((id + ", Nombre: " + nombre + ", Talla: " + talla + ", Precio: " + precio + ", Cantidad: ")));
                        cantidadOriginal = parseInt(document.getElementById("ORG" + id).value);
                        cantidad = parseInt(document.getElementById(id).value);
                        bloquearDisminucion = 0;
                        
                        if (cantidadOriginal === cantidad) {
                            if (cantidadPrevia > 0) {
                                cantidad = cantidad - cantidadPrevia;
                            }
                        }

                        if (isNaN(cantidadPrevia)) {
                            cantidadPrevia = 0;
                        }
                    
                        if (cantidad > 0){
                            if (cantidadPrevia >= 10 && bloquearDisminucion === 0){
                                document.getElementById(id).value = "" + cantidadOriginal - cantidadPrevia;
                                alert("Solo se pueden agregar 10 productos iguales");
                                bloquearDisminucion = 1;
                            }
                            else{
                                cantidad = cantidad - 1;
                                cantidadPrevia = cantidadPrevia + 1;
                                document.getElementById(id).value = cantidad;
                                localStorage.setItem((id + ", Nombre: " + nombre + ", Talla: " + talla + ", Precio: " + precio + ", Cantidad: "), cantidadPrevia);
                                alert("Se agrego el producto, totales agregados de este tipo: " + cantidadPrevia);
                            }
                        }
                        else{
                            alert("Se acabo el producto");  
                            document.getElementById(id).value = "0"; 
                        }
                    }

                    function quitar(id, nombre, talla, precio) {
                        cantidadPrevia = parseInt(localStorage.getItem((id + ", Nombre: " + nombre + ", Talla: " + talla + ", Precio: " + precio + ", Cantidad: ")));
                        cantidadOriginal = parseInt(document.getElementById("ORG" + id).value);
                        cantidad = parseInt(document.getElementById(id).value);
                        
                        if (cantidadOriginal !== cantidad) {
                            if (cantidadPrevia > 0) {
                                cantidad = cantidad + 1;
                                cantidadPrevia = cantidadPrevia - 1;
                                document.getElementById(id).value = cantidad;
                                localStorage.setItem((id + ", Nombre: " + nombre + ", Talla: " + talla + ", Precio: " + precio + ", Cantidad: "), cantidadPrevia);
                                alert("Se quito el producto, totales en carrito de este tipo: " + cantidadPrevia);
                            }
                            if (cantidadPrevia <= 0) {
                                localStorage.removeItem((id + ", Nombre: " + nombre + ", Talla: " + talla + ", Precio: " + precio + ", Cantidad: "));
                            }
                        }
                        else{
                            localStorage.removeItem((id + ", Nombre: " + nombre + ", Talla: " + talla + ", Precio: " + precio + ", Cantidad: "));
                            alert("No se han agregado productos de este tipo");
                        }
                    }
                </script>
                <h2>
                    Playeras
                </h2>
                
                <input type="button" onclick="limpiarCC()" style="width: 30%; margin-left: 5%;" class="intro" value="Limpiar todas las compras">
                <br>
                <div class="contenedor-tienda">
                    <%
                        String[] productosAMostrar = new Tienda.ManejoDeProductos().productosEnBD();
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
