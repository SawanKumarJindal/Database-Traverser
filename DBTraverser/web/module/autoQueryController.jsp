

<%@page import="com.DBTraverser.ManageAutoQuerySyntaxServices"%>

<%
    ManageAutoQuerySyntaxServices obj = new ManageAutoQuerySyntaxServices();
    if (request.getParameter("sbtnSave") != null) {
       
        String title = request.getParameter("txtTitle");
        String querySyntax = request.getParameter("taSyntax");
        obj.addAutoQuery(title, querySyntax);
        response.sendRedirect("ManageAutoQuerySyntax_mp.jsp");

    }

    if (request.getParameter("sbtnSaveAddNew") != null) {
       
        String title = request.getParameter("txtTitle");
        String querySyntax = request.getParameter("taSyntax");
        obj.addAutoQuery(title, querySyntax);
        response.sendRedirect("AddAutoQuerySyntax_mp.jsp");

    }

    if (request.getParameter("btnCancel") != null) {
        response.sendRedirect("ManageAutoQuerySyntax_mp.jsp");
    }

    if (request.getParameter("sbtnUpdate") != null) {
        
        String title = request.getParameter("txtTitle");
        String syntax = request.getParameter("taSyntax");
        String id = (String) ((request.getParameter("id2")));

        obj.update(title, syntax, id);

        response.sendRedirect("ManageAutoQuerySyntax_mp.jsp");
    }
%>
