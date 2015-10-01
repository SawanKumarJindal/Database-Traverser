<%-- 
    Document   : LogoutCheck
    Created on : 7 May, 2011, 11:58:51 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


    <%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    if(session.getAttribute("username")==null)
        {
%>
<jsp:forward page="LogoutCheckForward.jsp"></jsp:forward>
<%       
    }
%>