

<%@page import="com.bean.ManageCityBean"%>
<%@page import="com.DBTraverser.ManageAddressServices"%>
<%
    ManageAddressServices objServices=new ManageAddressServices();
    
      ManageCityBean objBean=objServices.viewCityDetail(request.getParameter("cityid"));
%>
<form  method="post" action="AddEditCityController.jsp" onsubmit="return ValidateEditCityForm()">
    <table border="0" cellpadding="2" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <strong>
                    City Details</strong>
                <br />
            </td>
        </tr>
         <% if (request.getParameter("msg") != null) {%>   <tr>    
            <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>   </td>    </tr><% }%>
        <tr>
            <td>
                <fieldset>
                    <table border="0" cellpadding="2" cellspacing="0" >
                        <tr>
                            <td colspan="2">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left">
                                            <table border="0" cellpadding="5" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <strong>Country</strong>
                                                    </td>

                                                    <td>
                                                        <label id="lblCountry" name="lblCountry"><%=session.getAttribute("countryname").toString()%></label> 
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            <table border="0" cellpadding="5" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <strong>State</strong>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label id="lblState" name="lblState"><%=session.getAttribute("statename").toString()%></label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td><input type="hidden" name="txtStateId" value="<%=request.getParameter("stateid")%>"/></td>
                            <td><input type="hidden" name="txtCityId" value="<%=request.getParameter("cityid")%>"/></td>
                        </tr>
                        <tr>
                            <td>
                                <strong>City Name </strong>
                            </td>
                            <td>
                                <input id="txtCityName" type="text" name="txtCityName" value="<%=objBean.getTxtCityName()%>" class="txtStyle"/>
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
                                        <td><input id="rbActive" type="radio" name="rbStatus" value="1" checked="checked" />  Active</td>
                                        <td><input id="rbInactive" type="radio" name="rbStatus" value="0"/>Inactive </td>
                                    </tr>
                                    <%} else{ %>
                                     <tr>
                                        <td><input id="rbActive" type="radio" name="rbStatus" value="1" />  Active</td>
                                        <td><input id="rbInactive" type="radio" name="rbStatus" value="0" checked/>Inactive </td>
                                    </tr>
                                    
                                    <% }%>
                                </table>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" align="right">
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <input id="sbtnUpdate"  name="sbtnUpdate" type="submit" value="Save" class="blue"/>
                                        </td>
                                        
                                        <td>
                                            <input id="rbtnReset" name="rbtnReset" type="reset" value="Reset" class="blue"/>
                                        </td>
                                        
                                        <td align="right" >
                                            <input id="btnBack" name="btnBack" type="button" value="Back" class="blue" onclick="window.location='ManageCity_mp.jsp?stateid=<%=request.getParameter("stateid")%>'" /></td>
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