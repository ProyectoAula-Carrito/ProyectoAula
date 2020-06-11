<%@page import="Cliente.ClienteAc"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%@page import="Cliente.Ingreso" %>
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
    <div class="contenedor">
        <header class="encabezado">
            <div class="im">
                <img src="img/funcionamiento.png" alt="LOGO" class="logo">
                <h1>WORLD RUNNERS</h1>	
            </div>
            <div class="nave">
                <nav class="">	
                    <a href="index.jsp" title="">Inicio</a>
                </nav>
            </div>	
        </header>
        <main>
    <section class="presentacion">
        <div class="contenedor-tienda">
            <h1>Procesando...</h1>
            <br>
<%try{
    int vajs=Integer.parseInt(request.getParameter("vajs"));
     if(vajs==6){
         response.sendRedirect("log.jsp");
     }else{
String password=request.getParameter("password");
Ingreso in=new Ingreso();
String correo=request.getParameter("correo");
in.setCorreo(correo);
in.setPassword(password);
int privilegio=ClienteAc.Log(in);
if(correo.matches("^(^[a-zA-Z-0-9]+@{1}[a-z]+(([.](com|web|org|gob|ipn)){1}([.](jp|es|mx))?){1}$){1}") && password.matches("^[a-zA-Z0-9]+${1,44}")){
if(privilegio==2){
    session.setAttribute("session","TRUE");
    response.sendRedirect("HomeAdmin.jsp");
}else if(privilegio==1){
    session.setAttribute("session", "TRUE");
    //response.sendRedirect("Tienda.jsp");
    out.print("<form id=\"irATienda\" action=\"Tienda.jsp\">");
%>

<input hidden type="text" id="Correo" name="Correo" value="<%out.print(correo);%>">

<%
    out.print("</form>");
    out.print("<script type=\"text/javascript\">document.getElementById(\"irATienda\").submit();</script>");
}else{
    out.print("<h1>Lo sentimos, correo y/o contraseña incorrecta</h1>");
}
}else{
    out.println("<h1>Los datos no son validos</h1>");
}
}
}catch(Exception e){
    response.sendRedirect("log.jsp");
}
%>
<br>
<a href="log.jsp" style="text-decoration: none;">Regresar</a>
        </div>                
    </section>
</main>
</div>
</body>
</html>