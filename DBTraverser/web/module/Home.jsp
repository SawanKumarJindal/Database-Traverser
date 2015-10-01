

<%
if(session.getAttribute("msg")!=null){
%>
<%=session.getAttribute("msg").toString()%>
<%

session.removeAttribute("msg");
}
%>