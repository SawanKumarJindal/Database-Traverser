

<%@page import="com.DBTraverser.QueryBean"%>
<%@page import="com.DBTraverser.ManageExpertAdviceServices"%>
<%
    if(request.getParameter("q")!=null){
        
        int q=Integer.parseInt(request.getParameter("q"));
        System.out.println(" qq "+q);
        ManageExpertAdviceServices objServices=new ManageExpertAdviceServices();
        QueryBean objBean=objServices.viewQuerySolutionsForUser(q);
        %>
        <table>   <tr>
                                <td valign="top">
                                    <strong>Solution Provided By</strong>
                                </td>
                                <td valign="top">
                                    <input class="txtStyle"  id="txtName" name="txtName" type="text" value="<%=objBean.getTxtUserName() %>" readonly="readonly"
                                           size="10 " />
                                </td>
                                <td valign="top" align="right">
                                    <strong>On</strong>
                                </td>
                                <td valign="top">
                                    <input class="txtStyle"  id="txtDate" name="txtDAte" type="text" value="<%=objBean.getTxtPostDate() %>" readonly="readonly"
                                           size="10 " />
                                </td>
                            </tr>
                           
                            <tr>
                                <td>
                                    <strong>Solution File</strong>
                                </td>
                                <td colspan="2">
                                    <a href="../FileDownloadServlet?path=<%=objBean.getFlQueryScriptFile()%>" >Download</a>
                                </td>
                            </tr>

                            <tr>
                                <td valign="top">
                                    <strong>Description</strong>
                                </td>
                                <td colspan="3">
                                    <textarea class="txtStyle" cols="50" rows="3" name="taDescription" id="taDescription"><%=objBean.getTaDescription() %></textarea>
                                </td>
                            </tr>
                          </table>
<%
    }
%>