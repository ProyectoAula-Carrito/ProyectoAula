<%-- 
    Document   : CompletarCompra
    Created on : 9/06/2020, 05:42:25 PM
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
                                <a href="Tienda.jsp" title="">Tienda</a>
                            </nav>
			</div>	
		</header>
		<main>
            <section class="presentacion">
                <h2>
                    Ordenes
                </h2>
                <div class="contenedor-tienda">
                    <form action="CompraCompleta.jsp">
                        <p id="OrdenesP" style="color: white;">
                            
                        </p>
                        <br>
                        <p id="Total" style="color: white;">
                            
                        </p>
                        <input id="OrdenesH" hidden name="OrdenesH" type="text" >
                        <br>
                        <input id="Comprar" type="submit" value="Comprar" class="intro" style="visibility: hidden;">
                    </form>

                    <script type="text/javascript">
                        ordenesString = "";
                        for (i = 0; i < localStorage.length; i++) {
                            ordenesString = ordenesString + (localStorage.key(i) + "=[" + localStorage.getItem(localStorage.key(i)) + "]") + "<br>";
                        }
                        
                        if (ordenesString === "") {

                        }
                        else{
                            comas = 0;
                            obtenerPrecioR = "";
                            obtenerPrecio = "";
                            obtenerCantidad = "";
                            copiarCantidad = 0;
                            precioTotal = 0;
                            br = 0;
                            idYCantidadDelProducto = "";
                            
                            for (var i = 0; i < ordenesString.length; i++) {
                                if (ordenesString.charAt(i) === ',') {
                                    comas = comas + 1;
                                }
                                if (comas === 0) {
                                    if (ordenesString.charAt(i) === '<') {
                                        br = 1;
                                    }
                                    else if (ordenesString.charAt(i) === '>') {
                                        br = 0;
                                        i = i + 1;
                                    }
                                    if (br === 0) {
                                        idYCantidadDelProducto = idYCantidadDelProducto + "" + ordenesString.charAt(i);
                                    }
                                }
                                if (comas === 4) {
                                    for (var j = i; j >= 0; j--) {
                                        if (ordenesString.charAt(j) !== ' '){
                                            obtenerPrecioR = obtenerPrecioR + "" + ordenesString.charAt(j);
                                        }
                                        else{
                                            break;
                                        }
                                    }
                                    
                                    for (var j = (obtenerPrecioR.length - 1); j > 0; j--) {
                                        obtenerPrecio = obtenerPrecio + obtenerPrecioR.charAt(j);
                                    }
                                    
                                    while(true){
                                        if (ordenesString.charAt(i) === '[') {
                                            copiarCantidad = 1;
                                            i = i + 1;
                                        }
                                        if (copiarCantidad === 1) {
                                            if (ordenesString.charAt(i) === ']'){
                                                comas = 0;
                                                copiarCantidad = 0;
                                                precioTotal = precioTotal + (parseInt(obtenerPrecio)*parseInt(obtenerCantidad));
                                                idYCantidadDelProducto = idYCantidadDelProducto + "-" + obtenerCantidad + ", ";
                                                obtenerPrecioR = "";
                                                obtenerPrecio = "";
                                                obtenerCantidad = ""
                                                break;
                                            }  
                                            else{
                                                obtenerCantidad = obtenerCantidad + "" + ordenesString.charAt(i);
                                            }
                                        }
                                        i = i + 1;
                                    }
                                }
                            }
                            
                            document.getElementById("OrdenesP").innerHTML = "" + ordenesString;
                            document.getElementById("Total").innerHTML = "Precio total: " + precioTotal + "$";
                            document.getElementById("OrdenesH").value = idYCantidadDelProducto;
                            document.getElementById("Comprar").style.visibility = "visible";
                        }
                    </script>
                </div>                
            </section>
        </main>
	</div>
</body>
</html>
