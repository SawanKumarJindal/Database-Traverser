
    <form action="../ChangePasswordController.jsp" method="POST" onsubmit="return check()">
        <table align="center" width="60%">
            <tr><td align="center"><b>Change Password</b></td></tr>
            <%
if(request.getParameter("msg")!=null){
%>
            <tr><td style="color: red"><label id="lblMessage"  ><%=request.getParameter("msg")%></label></td></tr><% } %>
            <tr>
                <td valign="center">
                    <fieldset  style="width:400px;border-style: double;">


                        <table   align="center" width="100%" >
                            <tr>
                                <td >
                                    <b>Username: </b>

                                </td><td>

                                    <input class="txtStyle" type="text" id="txtUsername" size="29" value="<%=session.getAttribute("username")%>" readonly="readonly" name="txtUsername"/>
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <b>Current Password: </b>

                                </td>
                                <td>

                                    <input class="txtStyle" type="password" id="txtCPassword" size="30" name="txtCPassword"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>New Password: </b>

                                </td><td  >

                                    <input class="txtStyle" type="password" id="txtNPassword" size="30" name="txtNPassword"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Confirm Password: </b>

                                </td><td  >

                                    <input class="txtStyle" type="password" id="txtCNPassword" size="30" name="txtCNPassword"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="submit" id="sbtnChange" class="blue"   name="sbtnChange" value="Change" /> 
                                    <input type="reset" id="rbtnReset"  class="blue" name="rbtnReset" value="Reset"  />
                                </td>
                            </tr>

                        </table>

                    </fieldset>
                </td></tr>


        </table>
    </form>
