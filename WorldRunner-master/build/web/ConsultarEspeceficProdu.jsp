<%@page import="Tienda.Search"%>
<%@page import="Tienda.ProductosAc"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%@page import="Tienda.Productoc" %>
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
                                <a href="CompletarCompra.jsp" title="">Productos</a>
                                <a href="Consultar.jsp">Clientes</a>
                            </nav>
			</div>	
		</header>
		<main>
            <section class="presentacion">
                   <%
                       String cproducto=request.getParameter("cproducto");
                       Search sr=new Search();
                       sr.setCproducto(cproducto);
                   List<Productoc> datos=ProductosAc.ConsultarbyCod(sr);
                   %>
                   <table>
                       <tr>
                           <th></th>
                           <th>Codigo-Producto</th>
                           <th>Nombre</th>
                           <th>Precio</th>
                           <th>Talla</th>
                           <th>Cantidad</th>
                       </tr>         
                <%
                    for (Productoc pr:datos) {
                            %>
                            <tr>
                                <td><%out.println("<img src='"+pr.getImg()+"'>");%></td>
                                <td><%out.println(pr.getNombre());%></td>
                                <td><%out.println(pr.getTalla());%></td>
                                <td><%out.println(pr.getPrecio()+"$");%></td>
                                <td><%out.println(pr.getCantidad());%></td>
                            </tr>
                       <%
                        }
                   %> 
                   </table>  
                   <div class="contenedor-formulario">
					<form action="ConsultarEspeceficProdu.jsp" method="get" accept-charset="utf-8" name="formulario">
						
						<h2>Buscar Algun producto mediante su Codigo-Producto</h2>
						Codigo-Producto:<br>
						<input type="text" name="cproducto" value="" placeholder="" class="intro"> <br><br>              
                                                <input type="submit" name="proceso" value="Buscar" onclick="" class="button">
                                                <input type="hidden" name="vajs" value="0">
					</form>
				</div>
            </section>
        </main>
	</div>
</body>
</html>
