

<%@page import="com.bean.QueryBean"%>
<%@page import="com.DBTraverser.ManageExpertAdviceServices"%>

<form action="../PostQueryResponseServlet" method="post" enctype="multipart/form-data" onsubmit="return ValidatePostQueryResponseForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top">
                <strong>Post Query Response</strong>
            </td>
        </tr>
        <% if (request.getParameter("msg") != null) {%>   <tr>    
            <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>   </td>    </tr>
            <% }

                ManageExpertAdviceServices objServices = new ManageExpertAdviceServices();
                int requestid = Integer.parseInt(request.getParameter("requestid"));
                QueryBean objBean = objServices.getRequestForAdviceByExpert(requestid);

            %>
        <tr>
            <td align="center">
                <table border="1" cellpadding="5" cellspacing="0" rules="none">
                    <tr>
                        <td align="left" colspan="2">
                            <table class="box" border="0" cellpadding="3" cellspacing="0">
                                <tr>
                                    <td>
                                        <input type="hidden" name="txtUserId" value="<%=session.getAttribute("id").toString()%>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="hidden" name="txtRequestId" value="<%=requestid%>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle">
                                        <strong>Query Request</strong>
                                    </td>
                                    <td valign="middle">
                                        <input class="txtStyle" id="txtQueryRequest" name="txtQueryRequest" type="text" value="<%=objBean.getTxtQueryRequest()%>" readonly="readonly"
                                               size="15 " />
                                    </td>
                                    <td valign="middle">
                                        <strong>By</strong>
                                    </td>
                                    <td valign="middle">
                                        <input class="txtStyle" id="txtName" name="txtName" type="text" value="<%=objBean.getTxtUserName()%>" readonly="readonly"
                                               size="10 " />
                                    </td>
                                    <td valign="middle">
                                        <strong>On</strong>
                                    </td>
                                    <td valign="middle">
                                        <input class="txtStyle" id="txtDate" name="txtDAte" type="text" value="<%=objBean.getTxtPostDate()%>" readonly="readonly"
                                               size="10 " />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>DB Script File </strong>
                        </td>
                        <td align="left"><a href="../FileDownloadServlet?path=<%=objBean.getFlQueryScriptFile()%>">Download</a>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <strong>DB Script Description</strong> &nbsp;
                        </td>
                        <td>
                            <textarea class="txtStyle" id="taScrDescription" name="taQueryDescription" readonly="readonly"><%=objBean.getTaDescription()%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Want to give solution </strong>
                        </td>
                        <td>
                            <input type="radio" name="rb" id="rbYes" checked="true" onclick="show()" value="1">Yes
                            <input type="radio" name="rb" id="rbNo" onclick="hide()" value="2">No
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div id="divResponse">
                                <table>
                                    <tr>
                                        <td>
                                            <strong>Source File Path</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle"   type="file" id="fiSourceFile" name="fiSourceFile">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <strong>Description</strong>
                                        </td>
                                        <td>
                                            <textarea class="txtStyle" name="taComment" id="taDescription" rows="2" cols="30"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td align="center" colspan="2">
                            <input onclick="window.location='ManageRequestForAdvice_mp.jsp'" class="blue" id="sbtnCancel" name="sbtnCancel" type="button" value="Cancel" />&nbsp;
                            <input class="blue" id="sbtnPost" name="sbtnPost" type="submit" value="Post" />&nbsp;
                    <input class="blue" id="rbtnReset" name="rbtnReset" type="Reset" value="Reset" /><tr>
                        </td>
                </table>
            </td>
        </tr>
    </table>
</form>
