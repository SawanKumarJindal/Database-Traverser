


<%@page import="com.bean.QueryBean"%>
<%@page import="com.DBTraverser.ManageExpertAdviceServices"%>
<table border="0" cellpadding="5" cellspacing="0" align="center">
    <tr>
        <td align="center" height="30" valign="top">
            <strong>View Query Detail</strong>
        </td>
    </tr>
    <% if (request.getParameter("msg") != null) {%>   <tr>    
        <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>   </td>    </tr><% }
            int requestid = Integer.parseInt(request.getParameter("requestid"));
            ManageExpertAdviceServices objServices = new ManageExpertAdviceServices();
            QueryBean objBean = objServices.viewQueryForUser(requestid);

        %>
    <tr>
        <td align="center">
            <table cellpadding="5" cellspacing="0">
                <tr>
                    <td>
                        <table class="box" border="1" cellpadding="5" cellspacing="0" rules="none">
                            <tr>
                                <td valign="top">
                                    <strong>Query Request</strong>
                                </td>
                                <td valign="top">
                                    <input class="txtStyle"  id="txtQueryRequest" name="txtQueryRequest" type="text" value="<%=objBean.getTxtQueryRequest()%>" readonly="readonly"  size="15 " />
                                </td>
                                <td valign="top">
                                    <strong>Post Date</strong>
                                </td>
                                <td valign="top">
                                    <input class="txtStyle"  id="txtDate" name="txtDAte" type="text" value="<%=objBean.getTxtPostDate()%>" readonly="readonly"  size="10 " />
                                </td>
                            </tr>
                            <%
                                if (!objBean.getFlQueryScriptFile().equalsIgnoreCase("")) {
                            %>
                            <tr>
                                <td colspan="2">
                                    DB Script File &nbsp;<a href="../FileDownloadServlet?path=<%=objBean.getFlQueryScriptFile()%>">Download</a>
                                <td>
                            </tr>
                            <% }%>
                            <tr>
                                <td valign="top" colspan="1">
                                    <strong>DB Script Description</strong>
                                </td>
                                <td colspan="3">
                                    <textarea class="txtStyle"  id="taDescription" cols="43" rows="2" name="taDescription" readonly="readonly"><%=objBean.getTaDescription()%></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <%
                                        if (objBean.getTxtSolution().equalsIgnoreCase("Available")) {
                                    %>
                                    <strong>Solution</strong> &nbsp;<a href="javascript:void(0)" onclick="getDetail(<%=objBean.getTxtSolutionId()%>)">Available</a>
                                    <%
                                    } else {
                                    %>
                                    <a href="javascript:void(0)" >Not Available</a>
                                    <%                                        }
                                    %>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div id="divAvailable">

                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input onclick="window.location='ExpertAdvise_mp.jsp'" class="blue" id="sbtnBackToAdvice" name="btnBackToAdvice" type="button" value="Back To Advice" />
                            <tr>
                                </td>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>