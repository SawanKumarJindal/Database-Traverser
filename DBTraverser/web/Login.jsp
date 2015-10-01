 
<form action="AuthenticationServlet" method="post"  onsubmit="return check()">
    <table   border="0" cellpadding="5" cellspacing="0" align="right"> 
        <tr>
            <td>
                <fieldset><legend><strong><em>&nbsp;Login&nbsp;</em></strong></legend>
                    <table class="box" cellpadding="0" cellspacing="0">
                        <%
                                         
                                            if (request.getParameter("msg") != null) {
                                               
                                            
                                         %>
                        <tr>
                            <td colspan="2"><label id="lblMsg"><small><%=request.getParameter("msg")%></small></label></td>
                        </tr>
                        <%}%>
                        <tr>

                            <td>User Name</td>
                            <td><input class="txtStyle" id="txtUserName" name="txtUserName"  type="text" /></td>

                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input class="txtStyle" id="txtPassword" name="txtPassword" type="password" /></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <input id="sbtnLogin" class="blue" name="sbtnLogin" type="submit" value="Login"/>
                                <input id="rbtnReset" name="rbtnReset" class="blue" type="reset" value="Reset"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" ><a href="ForgotPassword_mp.jsp" title="Forgot Password">forgot password?</a> | <a href="AccountInformation_mp.jsp" >Sign Up</a></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
</form>