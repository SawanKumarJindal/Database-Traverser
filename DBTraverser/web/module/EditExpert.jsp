

<%@page import="com.bean.CountryStateCityBean"%>
<%@page import="com.bean.AddEditExpertBean"%>
<
<%@page import="com.DBTraverser.ManageExpertServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.common.CountryStateCityServices"%>
<%
    ManageExpertServices objServices = new ManageExpertServices();
    AddEditExpertBean objBean = objServices.viewExpertQueryDetail(request.getParameter("userid"));
    CountryStateCityServices objCountryService = new CountryStateCityServices();
    ArrayList al = objCountryService.getAllCountryList();
    ArrayList als;
    ArrayList alc;
%>
<form action="AddEditExpertController.jsp" method="post" onsubmit="return ValidateEditExpertForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top">
                <strong>Edit Expert</strong>
            </td>
        </tr>
        <tr><td><input type="hidden" name="txtUserId" value="<%=request.getParameter("userid")%>"/></td></tr>
        <% if (request.getParameter("msg") != null) {%>   <tr>    
            <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>   </td>   
        </tr><% }%>
        <tr>
            <td>
                <table border="0" cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Account Information</em></strong> </legend>
                                <table class="box" border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <strong>User Name</strong>
                                        </td>
                                        <td><%=objBean.getTxtUsername()%>                </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Password</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtPassword" name="txtPassword" type="password" value="<%=objBean.getTxtPassword()%>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Confirm Password</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtConfirmPassword" name="txtConfirmPassword" type="password" value="<%=objBean.getTxtPassword()%>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Status</strong>
                                        </td>
                                        <td>
                                            <%
                                                if (objBean.getRbStatus().equalsIgnoreCase("1")) {
                                            %>
                                            <input type="radio" name="rbStatus" id="rbActive" checked="checked" value="1">Active
                                            <input type="radio" name="rbStatus" id="rbInactive" value="0">Inactive
                                            <%                                            } else {
                                            %>
                                            <input type="radio" name="rbStatus" id="rbActive" value="1" >Active
                                            <input type="radio" name="rbStatus" id="rbInactive" value="0" checked="checked">Inactive
                                            <%                                                }
                                            %>

                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
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
                                <input class="txtStyle" id="txtName" name="txtName" type="text" value="<%=objBean.getTxtName()%>" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Date Of Birth</strong>
                            </td>
                            <td>
                                <input class="txtStyle" id="txtDOB" name="txtDOB" type="text" value="<%=objBean.getTxtDOB()%>" readonly />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Gender</strong>
                            </td>
                            <td>
                                <%

                                    if (objBean.getRbGender().equalsIgnoreCase("M")) {
                                %>
                                <input type="radio" name="rbGender" id="rbMale" value="M" checked/>Male
                                <input type="radio" name="rbGender" id="rbFemale" value="F">Female
                                <%                                } else {
                                %>
                                <input type="radio" name="rbGender" id="rbMale" value="M" >Male
                                <input type="radio" name="rbGender" id="rbFemale" value="F" checked="checked"/>Female
                                <%                                    }
                                %>

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
                                <textarea class="txtStyle" cols="23" rows="3" name="taAddress" id="taAddress"><%=objBean.getTaAddress()%></textarea>
                        </tr>
                        <tr>
                            <td>
                                <strong>Country</strong>
                            </td>
                            <td>
                                <select id="ddlCountry" name="ddlCountry" onchange="showState(this.value)">
                                    <option value="-2">Select</option>
                                    <%

                                        for (int i = 0; i < al.size(); i++) {
                                            String str = "";
                                            CountryStateCityBean objBean1 = (CountryStateCityBean) al.get(i);
                                            if (objBean.getDdlCountry() == objBean1.getTxtCountryId()) {
                                                str = "selected";
                                            }
                                    %>
                                    <option value="<%=objBean1.getTxtCountryId()%>" <%=str%>><%=objBean1.getDdlCountryName()%></option>

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
                                        <option value="-2">Select</option>
                                        <%
                                            als = objCountryService.getAllStateList(objBean.getDdlCountry());
                                            alc = objCountryService.getAllCityList(objBean.getDdlState());
                                            for (int i = 0; i < als.size(); i++) {
                                                String str = "";
                                                CountryStateCityBean objBean2 = (CountryStateCityBean) als.get(i);
                                                if (objBean.getDdlState() == objBean2.getTxtStateId()) {
                                                    str = "selected";
                                                }
                                        %>
                                        <option value="<%=objBean2.getTxtStateId()%>" <%=str%>><%=objBean2.getDdlStateName()%></option>

                                        <%
                                            }%>
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
                                        <option value="-2">Select</option>
                                        <%

                                            for (int i = 0; i < alc.size(); i++) {
                                                String str = "";
                                                CountryStateCityBean objBean2 = (CountryStateCityBean) alc.get(i);
                                                if (objBean.getDdlCity() == objBean2.getTxtCityId()) {
                                                    str = "selected";
                                                }
                                        %>
                                        <option value="<%=objBean2.getTxtCityId()%>" <%=str%>><%=objBean2.getDdlCityName()%></option>

                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Pin</strong>
                            </td>
                            <td>
                                <input class="txtStyle" id="txtPin" name="txtPin" type="text" value="<%=objBean.getTxtPin()%>" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Phone</strong>
                            </td>
                            <td>
                                <input class="txtStyle" id="txtPhone" name="txtPhone" type="text" value="<%=objBean.getTxtPhone()%>" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Mobile</strong>
                            </td>
                            <td>
                                <input class="txtStyle" id="txtMobile" name="txtMobile" type="text" value="<%=objBean.getTxtMobile()%>" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Email ID</strong>
                            </td>
                            <td>
                                <input class="txtStyle" id="txtEmailID" name="txtEmailID" type="text" value="<%=objBean.getTxtEmailID()%>" />
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
                                <input class="txtStyle" id="txtDepartment" name="txtDepartment" type="text" value="<%=objBean.getTxtDepartment()%>" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Designation</strong>
                            </td>
                            <td>
                                <input class="txtStyle" id="txtDesignation" name="txtDesignation" type="text" value="<%=objBean.getTxtDesignation()%>" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Date Of Joining</strong>
                            </td>
                            <td>
                                <input class="txtStyle" id="txtDOJ" name="txtDOJ" type="text" value="<%=objBean.getTxtDOJ()%>" readonly />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <strong>Other Details</strong>
                            </td>
                            <td>
                                <textarea class="txtStyle" cols="23" rows="3" name="taOtherDetails" id="taOtherDetails"><%=objBean.getTaOtherDetails()%></textarea>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="right">
                <input class="blue" type="submit" name="sbtnUpdate" value="Update" id="sbtnUpdate">&nbsp;
                <input onclick="window.location='ManageExpert_mp.jsp'" class="blue" type="button" name="btnCancel" value="Cancel" id="btnCancel">
                <input class="blue" type="reset" name="rbtnReset" value="Reset" id="rbtnReset">
            </td>
        </tr>
    </table>
</form>
