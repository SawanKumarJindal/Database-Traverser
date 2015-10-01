



<%@page import="com.bean.CountryStateCityBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.common.CountryStateCityServices"%>

    <form method="POST" action="SignUpController.jsp"  onsubmit="return check()">
        <table align="center" width="60%">
            <tr><td align="center"><b>Sign Up</b></td></tr>
            <% if(request.getParameter("msg")!=null) { %>
            <tr><td style="color: red" align="center"><label id="lblMessage"  ><%=request.getParameter("msg")%></label></td></tr>
            <% } %>
            <tr>
                <td align="center">
                    <fieldset style="width:400px;border-style: double;">
                        <fieldset style="width: 92%" >
                            <legend>Account Information</legend>


                            <table   align="center" width="100%" class="styled">
                                <tr>
                                    <td align="left">
                                        <b>Username: </b>

                                    </td><td align="left">

                                        <input type="text" id="txtUsername" size="30"  class="txtStyle" value="" name="txtUsername"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="left">
                                        <b>Password: </b>

                                    </td><td align="left" >

                                        <input type="password"  class="txtStyle" id="txtPassword" size="30" name="txtPassword"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Confirm Password: </b>

                                    </td><td align="left" >

                                        <input type="password"  class="txtStyle" id="txtCNPassword" size="30" name="txtCNPassword"/>
                                    </td>
                                </tr>


                            </table>

                        </fieldset>
                        </br>

                        <fieldset style="width: 92%">
                            <legend>Personal Information</legend>
                            <table   align="center" width="100%" >
                                <tr>
                                    <td align="left">
                                        <b>Name: </b>

                                    </td><td align="left">

                                        <input type="text" class="txtStyle"  id="txtName" size="30" name="txtName"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="left">
                                        <b>Date Of Birth: </b>

                                    </td><td align="left" >

                                        <input type="text" class="txtStyle"  id="txtBirth" size="30" name="txtBirth" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Gender: </b>

                                    </td><td align="left" >

                                        Male: <input type="radio" checked id="rbMale"  name="rbGender" value="M"/>
                                        Female: <input type="radio" id="rbFemale"  name="rbGender" value="F"/>
                                    </td>
                                </tr>



                            </table>
                        </fieldset>
                        </br>

                        <fieldset style="width: 92%">
                            <legend>Address Information</legend>
                            <table   align="center" width="100%" >
                                <tr>
                                    <td align="left">
                                        <b>Address: </b>

                                    </td><td align="left">

                                        <textarea name="taAddress" class="txtStyle"  id="taAdress"  style="height: 20;width: 50"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left"><b>Country:</b></td>
                                    <td  align="left">
                                        <select id="ddlCountry" onchange="showState(this .value)"  name="ddlCountry">   <option value="-2">Select</option>
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
                                    <td  align="left"><b>State:</b></td>
                                    <td id="divState" align="left">
                                        <select id="ddlState" name="ddlState">
                                            <option value="-2">Select</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left"><b>City:</b></td>
                                    <td id="divCity" align="left">
                                        <select id="ddlCity" name="ddlCity"><option value="-2">Select</option></select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>PIN: </b>

                                    </td><td align="left" >

                                        <input type="text"  class="txtStyle" id="txtPin" size="30" name="txtPin"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Phone: </b>

                                    </td><td align="left" >

                                        <input type="text" class="txtStyle"  id="txtPhone" size="30" name="txtPhone"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="left">
                                        <b>Mobile: </b>

                                    </td><td align="left" >

                                        <input type="text" id="txtMobile"  class="txtStyle" size="30" name="txtMobile"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Email ID: </b>

                                    </td><td align="left" >

                                        <input type="text" class="txtStyle" id="txtEmail" size="30" name="txtEmail"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="submit" id="sbtnSubmitSign" class="blue" name="sbtnSubmitSign" value="Submit" /> 
                                        <input type="reset" id="rbtnReset" class="blue" name="rbtnReset" value="Reset"  />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </fieldset>
                </td></tr>
            <tr><td style="height: 200px"></td></tr>
        </table>
    </form>
