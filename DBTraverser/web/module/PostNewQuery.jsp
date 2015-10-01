
<form action="../PostQueryServlet" method="post" onsubmit="return ValidatePostQueryForm()" enctype="multipart/form-data">
<table border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td align="center" height="30" valign="top">
            <strong>Post New Query</strong>
        </td>
    </tr>
    <% if (request.getParameter("msg") != null) {%>   <tr>    
        <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>   </td>    </tr><% }%>
    <%
    String userid=session.getAttribute("id").toString();
%>
    <tr>
        <td>
            <table border="0" cellpadding="5" cellspacing="0">
                <tr>
                    <td>
                        
                            <fieldset>
                                <table class="box" border="0" cellpadding="5" cellspacing="0">
                                    <tr><td><input type="hidden" name="txtUserId" value="<%=userid%>"/></td></tr>
                                    <tr>
                                        <td>
                                            <strong>Query Request</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtQueryRequest" name="txtQueryRequest" type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Query Script File</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="flQueryScriptFile" name="flQueryScriptFile" type="file">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <strong>Description</strong>
                                        </td>
                                        <td>
                                            <textarea class="txtStyle" id="taDescription" cols="23" rows="2" name="taDescription"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input class="blue" id="sbtnPost" value="Post" name="sbtnPost" type="submit">&nbsp;
                        <input class="blue" id="rbtnReset" value="Reset" name="sbtnReset" type="Reset">&nbsp;
                        <input onclick="window.location='ExpertAdvise_mp.jsp'" class="blue" id="btnCancel" value="Cancel" name="btnCancel" type="button">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</form>

