

<%@page import="com.bean.CountryStateCityBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.common.CountryStateCityServices"%>
<%@page import="java.util.List"%>
<%@page import="com.DBTraverser.CommonServices"%>

<form  method="post" action="AddEditExpertController.jsp" onsubmit="return ValidateAddExpertForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top">
                <strong>Add Expert</strong>
            </td>
        </tr>   
        <% if(request.getParameter("msg")!=null){ %>   <tr>    
            <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>   </td>    </tr><% }%>
        <tr>
            <td>
                <table border="0" cellpadding="5" cellspacing="0">
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Account Information</em></strong> </legend>
                                <table class="box" border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <strong>User Name</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtUserName" name="txtUsername" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Password</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtPassword" name="txtPassword" type="password" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Confirm Password</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtConfirmPassword" name="txtConfirmPassword" type="password" />
                                        </td>
                                    </tr>
                                  
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Personal Information</em></strong> </legend>
                                <table class="box" border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <strong>Name</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtName" name="txtName" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Date Of Birth</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtDOB" name="txtDOB" type="text" readonly />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Gender</strong>
                                        </td>
                                        <td>
                                            <input type="radio" name="rbGender" id="rbMale" value="M" checked/> Male
                                            <input type="radio" name="rbGender" id="rbFemale" value="F"/>Female
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Address Information</em></strong> </legend>
                                <table class="box" border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td valign="top">
                                            <strong>Address</strong>
                                        </td>
                                        <td>
                                            <textarea class="txtStyle" cols="23" rows="3" name="taAddress" id="taAddress"></textarea>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Country</strong>
                                        </td>
                                        <td>
                                            <select id="ddlCountry" name="ddlCountry" onchange="showState(this.value)">
                                                <option value="-2" selected="selected">Select</option>
                                                   <%
                        CountryStateCityServices objServices=new CountryStateCityServices();
ArrayList al=objServices.getAllCountryList();
                            for(int i=0;i<al.size();i++){
                                                    CountryStateCityBean obj=(CountryStateCityBean)al.get(i);
                                                    %>
                                                        <option value="<%=obj.getTxtCountryId()%>"><%=obj.getDdlCountryName()%></option>
                                                        
                                            <%
                                                }
%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>State</strong>
                                        </td>
                                        <td>
                                            <div id="divState">
                                                <select id="ddlState" name="ddlState">
                                                    <option value="-2" selected="selected">Select</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>City</strong>
                                        </td>
                                        <td>
                                            <div id="divCity">
                                                <select id="ddlCity" name="ddlCity">
                                                    <option value="-2" selected="selected">Select</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Pin</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtPin" name="txtPin" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Phone</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtPhone" name="txtPhone" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Mobile</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtMobile" name="txtMobile" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Email ID</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtEmailID" name="txtEmailID" type="text" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Employee Information</em></strong> </legend>
                                <table class="box" border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <strong>Department</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtDepartment" name="txtDepartment" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Designation</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtDesignation" name="txtDesignation" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Date Of Joining</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtDOJ" name="txtDOJ" type="text" readonly/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <strong>Other Details</strong>
                                        </td>
                                        <td>
                                            <textarea class="txtStyle" cols="23" rows="3" name="taOtherDetails" id="taOtherDetails"></textarea>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <input class="blue" type="submit" name="sbtnSave" value="Save" id="sbtnSave">&nbsp;
                            <input class="blue" type="submit" name="sbtnSaveAddNew" value="Save &amp; Add New" id="sbtnSaveAddNew">&nbsp;
                            <input onclick="window.location='ManageExpert_mp.jsp'" class="blue" type="button" name="btnCancel" value="Cancel" id="btnCancel">
                            <input class="blue" type="reset" name="rbtnReset" value="Reset" id="rbtnReset">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>

