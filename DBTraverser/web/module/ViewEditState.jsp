
<%@page import="com.bean.ManageStateBean"%>
<%@page import="com.DBTraverser.ManageAddressServices"%>
<%
    ManageAddressServices objServices=new ManageAddressServices();
    String countryname=session.getAttribute("countryname").toString();
    ManageStateBean objBean=objServices.viewStateDetail(request.getParameter("stateid")) ;
%>
<form name="" method="post" action="AddEditStateController.jsp" onsubmit="return ValidateEditStateForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <strong>
                    State Detail</strong>
                <br />
            </td>
        </tr>
        <%
        if (request.getParameter("msg") != null) {
    %>
    <tr><td align="left"><label id ="lblMsg"><%=request.getParameter("msg")%></label></td></tr>
    <% }%>
        <tr>
            <td>
                <fieldset>
                    <table border="0" cellpadding="5" cellspacing="0">
                        <tr>
                            <td colspan="2">
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <strong>Country</strong>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <label id="lblCountry" name="lblCountry"><%=countryname%></label>
                                        </td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                        <tr>
                            <td><input type="hidden" name="txtCountryId" value="<%=request.getParameter("countryid")%>"/></td>
                        </tr>
                        <tr>
                            <td><input type="hidden" name="txtStateId" value="<%=request.getParameter("stateid")%>"/></td>
                        </tr>
                        <tr>
                            <td>
                                <strong>State Name </strong>
                            </td>
                            <td>
                                <input id="txtStateName" name="txtStateName" type="text" value="<%=objBean.getTxtStateName()%>" class="txtStyle"/>
                            </td>

                        </tr>

                        <tr>
                            <td>
                                <strong>Status </strong>
                            </td>
                            <td>
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <%
if(objBean.getRbStatus().equalsIgnoreCase("Active")){
%>
                                    <tr>
                                        <td>
                                            <input id="rbActive" type="radio" name="rbStatus" value="1" checked="checked" />
                                            Active
                                        </td>
                                        <td>
                                            <input id="rbInactive" type="radio" name="rbStatus" value="0"/>
                                            Inactive</td>
                                    </tr>
                                    <%} else{
                                    %>
                                    <tr>
                                        <td>
                                            <input id="rbActive" type="radio" name="rbStatus" value="1"/>
                                            Active
                                        </td>
                                        <td>
                                            <input id="rbInactive" type="radio" name="rbStatus" value="0" checked/>
                                            Inactive</td>
                                    </tr>
                                    <%
        
                                    } %>
                                </table>
                            </td>
                            
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <input id="sbtnSave" name="sbtnUpdate" type="submit" value="Save" class="blue"/>
                                        </td>
                                        
                                        <td>
                                            <input id="rbtnReset" name="rbtnReset" type="reset" value="Reset" class="blue"/>
                                        </td>
                                        <td align="right" >
                                            <input id="btnBack" name="btnBack" type="button" value="Back" class="blue" onclick="window.location='ManageState_mp.jsp?countryid=<%=request.getParameter("countryid")%>'"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
</form> 