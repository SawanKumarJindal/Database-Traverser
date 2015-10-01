
<%@page import="com.DBTraverser.ManageGroupServices"%>
<jsp:useBean id="objBean" class="com.bean.AddEditGroupBean">
    <jsp:setProperty name="objBean" property="*"/>
</jsp:useBean>
<%    
    ManageGroupServices objServices = new ManageGroupServices();
    String result = "not ";
    if (request.getParameter("sbtnSave") != null) {
       result = objServices.addGroupDetail(objBean);
        if (result.equalsIgnoreCase("found")) {
            response.sendRedirect("AddGroup_mp.jsp?msg=Group title already exists");
        } else if (result.equalsIgnoreCase("added")) {
            response.sendRedirect("ManageGroup_mp.jsp?msg=Record added successfully");
        } else {
            response.sendRedirect("AddGroup_mp.jsp?msg=Record not added successfully ");
        }
    } else if (request.getParameter("sbtnSaveAndAddNew") != null) {
        result = objServices.addGroupDetail(objBean);
        if (result.equalsIgnoreCase("found")) {
            response.sendRedirect("AddGroup_mp.jsp?msg=Group title already exists");
        } else if (result.equalsIgnoreCase("added")) {
            response.sendRedirect("AddGroup_mp.jsp?msg=Record added successfully");
        } else {
            response.sendRedirect("AddGroup_mp.jsp?msg=Record not added successfully ");
        }
    } else if (request.getParameter("sbtnUpdate") != null) {
        result = objServices.updateGroupDetail(objBean);
        response.sendRedirect("ManageGroup_mp.jsp?msg=Record updated successfully");
    } else {
        response.sendRedirect("ManageGroup_mp.jsp");
    }
    
    
    
%>