<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
if(session.getAttribute("username")==null)
{
	String url=request.getContextPath();
	out.print("session has been closed");
	response.sendRedirect(request.getContextPath()+"/login");
}
%>
    