<%@page import="com.bean.ManageAutoQuerySyntaxBean"%>
<%@page import="java.util.List"%>

<%@page import="com.DBTraverser.ManageAutoQuerySyntaxServices"%>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE HTML >
<%
    ManageAutoQuerySyntaxServices service = new ManageAutoQuerySyntaxServices();

    List list = service.viewQuery(request.getParameter("id"));
    ManageAutoQuerySyntaxBean objBean = null;


%>

<body>
    <form action="autoQueryController.jsp" method="GET">
        <table align="center" width="50%">
            <tr><td align="center"><b>Edit Auto Query Syntax</b></td></tr>
            <tr><td align="left"><label id="lblMessage" ></label></td></tr>
            <tr>
                <td>
                    <fieldset>
                        <%
                            if (list.size() > 0) {
                                for (int a = 0; a < list.size(); a++) {
                                    objBean = (ManageAutoQuerySyntaxBean) list.get(a);
                        %>
                        <table width="100%" class="styled">
                            <tr><td>
                                    <b>Title</b>
                                </td>
                                <td>
                                    <input type="text"  class="txtStyle" id="txtTitle" value="<%=objBean.getTitle()%>" name="txtTitle"/>
                                </td>
                            </tr>
                            <tr><td>
                                    <b>Syntax</b>
                                </td>
                                <td>
                                    <textarea id="taSyntax" class="txtStyle"  name="taSyntax" rows="4" cols="35"><%=objBean.getQuerySyntax()%></textarea>
                                </td>
                            </tr>
                            <tr>

                                <td colspan="3">
                                    <input type="submit" id="sbtnUpdate"  name="sbtnUpdate" value="Update" class="blue" />&nbsp;&nbsp;
                                    <input type="reset" id="rbtnReset" name="rbtnReset" value="Reset" class="blue" />&nbsp;&nbsp;<input type="button" id="btnCancel" onclick="window.location='ManageAutoQuerySyntax_mp.jsp'" name="btnCancel" value="Cancel" class="blue" />

                                </td>
                            </tr>
                            <tr><td> <input type="hidden" name="id2" value="<%=request.getParameter("id")%>" /></td>
                            </tr>
                        </table>
                        <%                                         }
                            } else {
                                out.println("No record Found");
                            }
                        %>
                    </fieldset>
                </td>
            </tr>
        </table>
    </form>
</body>