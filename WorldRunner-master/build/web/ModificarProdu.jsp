<%@page import="Tienda.Search"%>
<%@page import="Tienda.ProductosAc"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%@page import="Tienda.Productoc" %>
<%@ page language="java" %>
<%@ page import = "java.util.LinkedList"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <div class="contenedor">
        <header class="encabezado">
            <div class="im">
                <img src="img/funcionamiento.png" alt="LOGO" class="logo">
                <h1>WORLD RUNNERS</h1>	
            </div>
            <div class="nave">
                <nav class="">	
                    <a href="ConsultarProdu.jsp" title="">Volver</a>
                </nav>
            </div>	
        </header>
        <main>
    <section class="presentacion">
        <div class="contenedor-tienda">
            <h1>Error</h1>
<%try{
    int vajs=Integer.parseInt(request.getParameter("vajs"));
     if(vajs==6){
         response.sendRedirect("log.jsp");
     }else{
String cproducto=request.getParameter("codigo");
String nombre=request.getParameter("nombre");
String preciov=request.getParameter("precio");
int precio=Integer.parseInt(request.getParameter("precio"));
String talla=request.getParameter("talla");
String cantidadv=request.getParameter("cantidad");
int cantidad=Integer.parseInt(request.getParameter("cantidad"));
String img="img/"+request.getParameter("img");
String vimg=request.getParameter("img");
Productoc pr=new Productoc();
pr.setCproducto(cproducto);pr.setNombre(nombre);pr.setPrecio(precio);pr.setTalla(talla);pr.setCantidad(cantidad);pr.setImg(img);
boolean estatus=ProductosAc.Modificar(pr);
if(cproducto.matches("(^[T])+([0-9]+${1,5})") && nombre.matches("^[A-Za-záéíóúÁÉÍÓÚ\\s]+${1,49}") && preciov.matches("^[0-9]+${1,6}") && talla.matches("(XS|CH|MD|GR|XL)") && cantidadv.matches("^[0-9]+${1,6}") && vimg.matches("^^(^[a-zA-Z-0-9]+(([.](png|jpg|gif|jpge|csv)){1}$){1}")){//validacion
if(estatus){
    
    response.sendRedirect("ConsultarProdu.jsp");
}else{
    response.sendRedirect("ConsultarProdu.jsp");
}
}else{
    out.println("<h1>Los datos no son validos</h1>");
}}}catch(Exception e){
    response.sendRedirect("ConsultarProdu.jsp");
}
%>
<br>
        </div>                
    </section>
</main>
</div>
</body>
</html>
