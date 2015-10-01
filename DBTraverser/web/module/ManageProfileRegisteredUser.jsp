

<%@page import="com.bean.CountryStateCityBean"%>
<%@page import="com.bean.ManageProfileRegisteredUserBean"%>
<%@page import="com.common.CountryStateCityServices"%>
<%@page import="com.DBTraverser.CommonServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.DBTraverser.ManageProfileRegisteredUserServices"%>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<%
    ManageProfileRegisteredUserServices service = new ManageProfileRegisteredUserServices();

    int id = (Integer) session.getAttribute("id");
    ManageProfileRegisteredUserBean objBean = service.getProfileInfo(id);
    CountryStateCityServices objCountryService = new CountryStateCityServices();
    ArrayList als;
    ArrayList alc;
%>

<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="validations.js"></script>
        <script type="text/javascript">
            function check()
            {
               
                var msg = document.getElementById("lblMessage");

                var name1 = document.getElementById("txtName").value;
                var empn = isEmpty(name1);
                var namen = isName(name1);
                var dob = document.getElementById("txtBirth").value;
                var empdob = isEmpty(dob);
                var pin = document.getElementById("txtPin").value;
                var emppin = isEmpty(pin);  
                var phone = document.getElementById("txtPhone").value;
                var empphone = isEmpty(phone);
                var mobile = document.getElementById("txtMobile").value;
                var empmobile = isEmpty(mobile);
                var email = document.getElementById("txtEmail").value;
                var empemail = isEmpty(email);
                var isemail = isEmail(email);
                  
                if(empn==true)
                {
                    document.getElementById("txtName").focus();
                    msg.innerHTML="Enter Name";
                    return false;
                }
                if(namen==false)
                {
                    document.getElementById("txtName").focus();
                    msg.innerHTML="Enter Name Properly";
                    return false;
                }
                if(empdob==true)
                {
                    document.getElementById("txtBirth").focus();
                    msg.innerHTML="Enter Date of Birth";
                    return false;
                }
                if(emppin==true)
                {
                    document.getElementById("txtPin").focus();
                    msg.innerHTML="Enter Pin";
                    return false;
                }
                if(empphone==true)
                {
                    document.getElementById("txtPhone").focus();
                    msg.innerHTML="Enter phone no";
                    return false;
                }
                if(empmobile==true)
                {
                    document.getElementById("txtMobile").focus();
                    msg.innerHTML="Enter Mobile";
                    return false;
                }
                if(empemail==true)
                {
                    document.getElementById("txtEmail").focus();
                    msg.innerHTML="Enter Email id";
                    return false;
                }
                if(isemail==false)
                {
                    document.getElementById("txtEmail").focus();
                    msg.innerHTML="Enter correct Email id";
                    return false;
                }
                    
                    
                return true;  
                   
               
            }
        </script>
    </head>
    <body>
        <form  method="post" action="../ManageProfileRegisteredUserController.jsp" onsubmit="return check()">
            <table align="center" width="50%">
                <tr><td align="center"><b>Manage Profile</b></td></tr>
                <% if (request.getParameter("msg") != null) {%> 
                <tr>    <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>  
                    </td></tr>
                <% }%>
                <tr>
                    <td align="left">
                        <table   align="center" width="100%" >
                            <tr>
                                <td align="left">
                                    <b>User Name: </b>

                                </td><td align="left"><%=objBean.getTxtUsername()%>
                                </td>
                            </tr>

                        </table>
                        <fieldset style="width: 92%">
                            <legend><b>Personal Information</b></legend>
                            <table   align="center" width="100%" >
                                <tr>
                                    <td><input type="hidden" name="txtUserId" value="<%=id%>"/></td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Name: </b>

                                    </td><td align="left">

                                        <input type="text" class="txtStyle" id="txtName" value="<%=objBean.getTxtName()%>" size="30" name="txtName"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="left">
                                        <b>Date Of Birth: </b>

                                    </td><td align="left" >

                                        <input type="text" class="txtStyle" id="txtBirth" size="30" value="<%=objBean.getTxtBirth()%>" name="txtBirth"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Gender: </b>

                                    </td><td align="left" >
                                        <%
                                            String g = (String) objBean.getRbGender();
                                            if (g.equalsIgnoreCase("m")) {

                                        %>

                                        Male: <input type="radio" id="rbMale" checked  name="rbGender" value="M"/>
                                        Female: <input type="radio" id="rbFemale" name="rbGender" value="F"/>
                                        <%                                            } else  {

                                        %>
                                        Male: <input type="radio" id="rbMale"  name="rbGender" value="M"/>
                                        Female: <input type="radio" id="rbFemale" checked name="rbGender" value="F"/>
                                        <%} 
                                        %>
                                       
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <br/>

                        <fieldset style="width: 92%">
                            <legend><b>Contact Information</b></legend>
                            <table   align="center" width="100%" >
                                <tr>
                                    <td align="left">
                                        <b>Address: </b>

                                    </td><td align="left">

                                        <textarea name="taAddress" class="txtStyle" cols="38"id="taAddress" style="height: 20;width: 50"><%=objBean.getTaAddress()%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left"><b>Country:</b></td>
                                    <td  align="left">
                                        <select id="ddlCountry" name="ddlCountry" onchange="showState(this.value)">
                                             <option value="-2">Select</option>
                                             <%

                                                    List list1 = objCountryService.getAllCountryList() ;
                                                    for (int b = 0; b < list1.size(); b++) {
                                                         CountryStateCityBean objBean2 = (CountryStateCityBean) list1.get(b);
                                                        if (objBean2.getTxtCountryId() == objBean.getDdlCountry()) {
                                            %>
                                            <option selected value=<%=objBean2.getTxtCountryId()%>><%=objBean2.getDdlCountryName()%></option>
                                            <%
                                            } else {

                                            %>
                                            <option value=<%=objBean2.getTxtCountryId()%>><%=objBean2.getDdlCountryName()%></option>
                                            <%}
                                                    }

                                            
                                            %>
                                        </select>
                                    </td>
                                </tr>
                                 <%
                                    als = objCountryService.getAllStateList(objBean.getDdlState());
                                    alc = objCountryService.getAllCityList(objBean.getDdlCity());
                                %>
                                <tr>
                                    <td align="left"><b>State:</b></td>
                                    <td  align="left">
                                        <div id="divState">
                                        <select id="ddlState" name="ddlState">
                                             <option value="-2">Select</option>
                                                <%
                                                    for (int i = 0; i < als.size(); i++) {
                                                     
                                                        CountryStateCityBean objBean2 = (CountryStateCityBean) als.get(i);
                                                        if (objBean.getDdlState() == objBean2.getTxtStateId()) {
                                                           %>
                                                <option value="<%=objBean2.getTxtStateId()%>" selected><%=objBean2.getDdlStateName()%></option>

                                                <%
                                                        } else{
                                                %>
                                                <option value="<%=objBean2.getTxtStateId()%>"><%=objBean2.getDdlStateName()%></option>

                                                <%
                                            } } %>
                                        </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left"><b>City:</b></td>
                                    <td  align="left">
                                        <div id="divCity">
                                        <select id="ddlCity" name="ddlCity">
                                             <option value="-2">Select</option>
                                                <%
                                                    for (int i = 0;i < alc.size();i++) {
                                                      
                                                        CountryStateCityBean objBean2 = (CountryStateCityBean) alc.get(i);
                                                        if (objBean.getDdlCity() == objBean2.getTxtCityId()) {
                                                           %>
                                                <option value="<%=objBean2.getTxtCityId()%>" selected><%=objBean2.getDdlCityName()%></option>

                                                <%
                                                        }else{
                                                %>
                                                <option value="<%=objBean2.getTxtCityId()%>"><%=objBean2.getDdlCityName()%></option>

                                                <%
                                                    } }
                                                %>
                                        </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>PIN: </b>

                                    </td><td align="left" >

                                        <input type="text" id="txtPin" class="txtStyle" value="<%=objBean.getTxtPin()%>" size="30" name="txtPin"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Phone: </b>

                                    </td><td align="left" >

                                        <input type="text" id="txtPhone" class="txtStyle" value="<%=objBean.getTxtPhone()%>" size="30" name="txtPhone"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="left">
                                        <b>Mobile: </b>

                                    </td><td align="left" >

                                        <input type="text" id="txtMobile" class="txtStyle" value="<%=objBean.getTxtMobile()%>" size="30" name="txtMobile"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Email ID: </b>

                                    </td><td align="left" >

                                        <input type="text" id="txtEmail" class="txtStyle" size="30" value="<%=objBean.getTxtEmail()%>" name="txtEmail"/>
                                    </td>
                                </tr>

                            </table>
                        </fieldset>

                    </td></tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" id="sbtnSubmit" class="blue"  name="sbtnSubmit" value="Update" />
                        <input type="reset" id="rbtnReset" class="blue"  name="rbtnReset" value="Reset"  />
                    </td>
                </tr>


            </table>
        </form>

    </body>
</html>
