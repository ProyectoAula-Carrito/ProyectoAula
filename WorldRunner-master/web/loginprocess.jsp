<%@page import="bean.LoginBean"%>
<%@page import="bean.LoginDao"%>
<jsp:useBean id="obj" class="bean.LoginBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
boolean status=LoginDao.validate(obj);
if(status){
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
}
%>
