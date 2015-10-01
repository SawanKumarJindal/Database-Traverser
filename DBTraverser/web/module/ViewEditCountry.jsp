
<%@page import="com.bean.ManageCountryBean"%>
<%@page import="com.DBTraverser.ManageAddressServices"%>
<%
    ManageAddressServices objServices=new ManageAddressServices();
    ManageCountryBean objBean=objServices.viewCountryDetail(request.getParameter("countryid"));
%>
<form  method="post" action="AddEditCountryController.jsp" onsubmit="return ValidateEditCountryForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <strong>Country Detail</strong><br />
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
                        <tr><td><input type="hidden" value="<%=request.getParameter("countryid")%>" name="txtCountryId"/></td></tr>
                        <tr> 
                            <td>
                                <strong>Country Name </strong>
                            </td>
                            <td>
                                <input value="<%=objBean.getTxtCountryName()%>" id="txtCountryName" name="txtCountryName" type="text" class="txtStyle"/>
                            </td> 
                        </tr>

                        <tr>
                            <td>
                                <strong>Status</strong>
                            </td>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <%
if(objBean.getRbStatus().equalsIgnoreCase("Active")){
%>
                                    <tr>
                                        <td>
                                            <input id="rbActive" type="radio" name="rbStatus" checked="checked" value="1"/>                                            
                                                Active
                                        </td>
                                        <td>
                                            <input id="rbInactive" type="radio" name="rbStatus" value="0"/>                                           
                                                Inactive
                                        </td>
                                    </tr>
                                    <% }else{%>
                                    <tr>
                                        <td>
                                            <input id="rbActive" type="radio" name="rbStatus"  value="1"/>                                            
                                                Active
                                        </td>
                                        <td>
                                            <input id="rbInactive" type="radio" name="rbStatus" value="0" checked/>                                           
                                                Inactive
                                        </td>
                                    </tr>
                                    <% }%>
                                </table>
                            </td>
                            
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <input id="sbtnSave" name="sbtnUpdate" type="submit" value="Save" class="blue" />
                                        </td>
                                       
                                        <td>
                                            <input id="rbtnReset"  name="rbtnReset" type="reset" value="Reset" class="blue"/>
                                        </td>
                                        
                                        <td align="right" >
                                            <input id="btnBack" name="btnBack" type="button" value="Back" class="blue" onclick="window.location='ManageCountry_mp.jsp'"/></td>
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