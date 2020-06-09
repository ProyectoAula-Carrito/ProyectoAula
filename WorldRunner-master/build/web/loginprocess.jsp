<%@page import="Cliente.ClienteAc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%@page import="Cliente.Ingreso" %>
<%

String correo=request.getParameter("correo");
String password=request.getParameter("password");
Ingreso in=new Ingreso();
in.setCorreo(correo);
in.setPassword(password);
boolean estatus=ClienteAc.Log(in);
out.println(correo);
out.println(password);
if(correo.matches("^(^[a-zA-Z-0-9]+@{1}[a-z]+(([.](com|web|org|gob|ipn)){1}([.](jp|es|mx))?){1}$){1}") && password.matches("^[a-zA-Z0-9]+${1,44}")){
if(estatus){
    session.setAttribute("session","TRUE");
    out.println("Felicidades, has ingresado correctamente\n" );
    response.sendRedirect("Consultar.jsp");
%>
<br><br><a href="Consultar.jsp">Ingresar</a>
<%

}
else
{
out.print("Lo sentimos, correo y/o contraseña incorrecta, favor de revisar");
%>
<br><br><a href="index.jsp">Regresar al inicio</a>
<%
}}else{
out.println("Los datos no son validos");
}
%>
