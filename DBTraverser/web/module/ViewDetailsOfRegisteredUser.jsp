
<%@page import="com.bean.HistoryBean"%>
<%@page import="com.bean.AvailableGroupRightsBean"%>
<%@page import="com.bean.ViewRegisteredUserBean"%>
<%@page import="com.DBTraverser.encode"%>
<%@page import="java.util.List"%>
<%@page import="com.DBTraverser.CommonServices"%>
<%@page import="com.DBTraverser.AvailableGroupRightsServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBTraverser.RegisteredUserServices"%>

<%
    RegisteredUserServices objServices = new RegisteredUserServices();
    String userid = request.getParameter("userid");
    ViewRegisteredUserBean objBean = objServices.viewRegisteredUser(request.getParameter("userid"));
    AvailableGroupRightsServices objgroupServices = new AvailableGroupRightsServices();
    ArrayList alPresent = objgroupServices.getPresentGroupAndRight(userid);
    ArrayList alOld = objgroupServices.getOldGroupAndRights(userid);

%>

<table align="center" width="50%">
    <tr>
        <td align="center">
            <b>View Details Of Registered User</b>
        </td>
    </tr>
    <tr>
        <td align="center">
            <fieldset>
                <legend><b>User Information</b></legend>
                <table width="100%" align="center">
                    <tr>
                        <td align="left">
                            <b>User Name</b></td>
                        <td><input type="text" id="txtUName" readonly class="txtStyle" name="txtUName" value="<%=objBean.getTxtLoginName()%>"/></td>
                        <td>
                            <b>Last Login</b></td>
                        <td><input type="text" id="txtLastLogin" readonly class="txtStyle" name="txtLastLogin" value="<%=objBean.getTxtLastLogin()%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Name</b></td>
                        <td><input type="text" id="txtName" readonly name="txtName" class="txtStyle" value="<%=objBean.getTxtName()%>"/></td>
                        <td>
                            <b>Gender</b>
                        </td>
                        <td>
                            <input type="text" class="txtStyle" id="txtGender" readonly name="txtGender" value="<%=objBean.getTxtGender()%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Date Of Birth</b>
                        </td>
                        <td>
                            <input type="text" id="txtDob" class="txtStyle" readonly name="txtDob" value="<%=objBean.getTxtDob()%>"/>

                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Phone</b>
                        </td>
                        <td>
                            <input type="text" id="txtPhone" readonly class="txtStyle" name="txtPhone" value="<%=objBean.getTxtPhone()%>"/>
                        </td>
                        <td>
                            <b>Mobile</b>
                        </td>
                        <td>
                            <input type="text" id="txtMobile" readonly class="txtStyle" name="txtMobile" value="<%=objBean.getTxtMobile()%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Address</b>
                        </td>
                        <td>
                            <textarea id="taAddress" readonly cols="38" class="txtStyle" name="taAddress"><%=objBean.getTaAddress()%></textarea>

                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Country</b>
                        </td>
                        <td>
                            <input type="text" id="txtCountry" class="txtStyle" readonly name="txtCountry" value="<%=objBean.getTxtCountry()%>"/>
                        </td>
                        <td>
                            <b>State</b>
                        </td>
                        <td>
                            <input type="text" id="txtState" readonly class="txtStyle" name="txtState" value="<%=objBean.getTxtState()%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>City</b>
                        </td>
                        <td>
                            <input type="text" id="txtCity" readonly name="txtCity" class="txtStyle" value="<%=objBean.getTxtCity()%>"/>
                        </td>
                        <td>
                            <b>Pin</b>
                        </td>
                        <td>
                            <input type="text" id="txtPin" readonly name="txtPin" class="txtStyle" value="<%=objBean.getTxtPin()%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Email</b>
                        </td>
                        <td>
                            <input type="text" id="txtEmail" readonly name="txtEmail" class="txtStyle" value="<%=objBean.getTxtEmail()%>"/>

                        </td>
                    </tr>
                </table>

            </fieldset>

        </td>
    </tr>
    <tr>
        <td align="left">
            <fieldset>
                <legend><b>Group Information</b></legend>
                <table align="left" width="90%">
                    <tr>
                        <td align="left">
                            <b>Present Group</b>
                        </td>
                    </tr>

                    <%
                        String title = "";
                        if (alPresent.size() > 0) {
                            for (int j = 0; j < alPresent.size(); j++) {
                                AvailableGroupRightsBean objBean1 = (AvailableGroupRightsBean) alPresent.get(j);

                    %>
                    <tr>
                        <td align="center">
                            <b>Group</b>
                        </td>
                        <td><%=objBean1.getTxtTitle()%>  </td>
                        <td>
                            <b>Allocation Date</b>
                        </td>
                        <td><%=objBean1.getTxtAllocationDate()%>  </td>
                    </tr>
                    <tr>
                        <td align="center" rowspan="3" valign="top">
                            <b>Rights</b>
                        </td>
                        <td>
                            <ul>
                                <%

                                    if (objBean1.getAlRights() != null) {
                                        ArrayList al = objBean1.getAlRights();
                                        if (al.size() > 0) {
                                            for (int i = 0; i < al.size(); i++) {
                                                title = (String) al.get(i);

                                %>
                                <li><%=title%></li>
                                <%    }
                                        }
                                    }%>
                            </ul>
                        </td>
                        <td>
                            <b>Unlimited</b>
                        </td>
                        <td><%=objBean1.getTxtUnlimited()%> </td>
                    </tr>
                    <tr>
                        <td >
                            <b>Valid till</b>
                        </td>
                        <td><%=objBean1.getTxtValidity()%>           </td>
                    </tr>
                    <%    }

                    } else {
                    %>
                    <tr><td colspan="6"> No Group Founds</td></tr>
                    <%                                                    }%>
                    <tr>
                        <td colspan="4">
                            <hr />
                        </td>
                    </tr>

                    <tr>
                        <td align="left">
                            <b>Old Group(s)</b>
                        </td>
                    </tr>
                    <%
                        if (alOld.size() > 0) {
                            for (int j = 0; j < alOld.size(); j++) {
                                AvailableGroupRightsBean objBean1 = (AvailableGroupRightsBean) alOld.get(j);


                    %>
                    <tr>
                    <tr>
                        <td align="center">
                            <b>Group</b>
                        </td>
                        <td><%=objBean1.getTxtTitle()%>  </td>
                        <td>
                            <b>Allocation Date</b>
                        </td>
                        <td><%=objBean1.getTxtAllocationDate()%>  </td>
                    </tr>
                    </tr>
                    <tr>
                        <td align="center">
                            <b>Rights</b>
                        </td>
                        <td>
                            <ul>
                                <%
                                    title = "";
                                    if (objBean1.getAlRights() != null) {
                                        ArrayList al1 = objBean1.getAlRights();
                                        if (al1.size() > 0) {
                                            for (int i = 0; i < al1.size(); i++) {
                                                title = (String) al1.get(i);

                                %>
                                <li><%=title%></li>
                                <%    }
                                        }
                                    }%>
                            </ul>
                        </td>
                        <td>
                            <b>Unlimited</b>
                        </td>
                        <td><%=objBean1.getTxtUnlimited()%> </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <b>Valid till</b>
                        </td>
                        <td colspan="2" align="left"><%=objBean1.getTxtValidity()%>           </td>
                    </tr>
                    <% }
                    } else {
                    %>
                    <tr><td colspan="5"> No Record Found</td></tr>
                    <%                            }%>
                </table>
            </fieldset>
        </td>
    </tr>

    <%

        CommonServices services = new CommonServices();
        List list = services.getrecentActivity(Integer.parseInt(userid));
        HistoryBean objHistoryBean = null;
        encode e = new encode();

    %>
    <tr>
        <td align="center">
            <b>Last 30 day activity</b>
        </td>
    </tr>
    <tr>
        <td>
            <table align="center" border="2" width="50%" class="styled">
                <tr class="header">
                    <th><b>Date</b></th>
                    <th><b>Query</b></th>
                </tr>
                <%
                    if (list.size() > 0) {
                        for (int i = 0; i < list.size(); i++) {
                            objHistoryBean = (HistoryBean) list.get(i);
String strClass = "";
                            if (i % 2 == 0) {
                                strClass = "alt";
                            }

                %>
                <tr class="<%=strClass%>">
                    <td align="left">
                        <b> <%=objHistoryBean.getDate()%></b>
                    </td>
                    <td align="left">
                        <%=e.decoder((String) (objHistoryBean.getQuery()))%>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr><td colspan="6"> No Record Found</td>
                </tr>
                <%                                        }
                %>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="5" align="center"><form action="AvailableGroupAndRightController.jsp">
                <table align="center">
                    <tr>
                        <td align="center">
                            <% if(objBean.getRbStatus().equalsIgnoreCase("Active")){
                            %>
                             <b>Status</b><input type="radio" id="rbtnActive" name="rbtnStatus" value="Active" checked/>Active
                            <input type="radio" id="rbtnInactive" name="rbtnStatus" value="Inactive"/>Inactive
                            <%
                            } else {
                            %>
                             <b>Status</b><input type="radio" id="rbtnActive" name="rbtnStatus" value="Active"/>Active
                            <input type="radio" id="rbtnInactive" name="rbtnStatus" value="Inactive" checked/>Inactive
                            <%
                                
                            }
                            %>
                           

                        </td>
                    </tr>
                    <tr><td>
                            <input type="hidden" name="txtUserId" value="<%=userid%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="submit" class="blue" id="btnUpdate" name="btnUpdateUser" value="Update"/>
                            <input type="button" class="blue" id="btnReset" name="btnReset" value="Reset"/>
                            <input type="button" class="blue" id="btnCancel" name="btnCancel" value="Cancel" onclick="window.location='ManageRegisteredUser_mp.jsp'"/>
                        </td>
                    </tr>
                </table></form>
        </td>
    </tr>

</table>
