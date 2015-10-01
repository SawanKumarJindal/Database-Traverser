<%@include file="LogoutCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DBTraverser</title>
        <jsp:include page="stylesheet.jsp"/>
        <script type="text/javascript" src="validations.js"></script>
        <script type="text/javascript">
            var objHttp;
            var i=0;
            function getXMLHttpRequest(){

                objHttp = new XMLHttpRequest();
                if(objHttp == null){
                    objHttp = new ActiveXObject();
                }
                if(objHttp == null){
                    alert("Your browser doesn't support ajax");
                }
            }
            
            function showState(str)
            {
                if(str=="-2"){
                    document.getElementById("divState").innerHTML='<select id="ddlState" name="ddlState"><option value="-2" >Select</option></select>'
                    document.getElementById("divCity").innerHTML='<select id="ddlCity" name="ddlCity"><option value="-2" >Select</option></select>'
                }else{
                
                    i=1;
                    getXMLHttpRequest();

                    var url="getState.jsp";
                    url=url+"?q="+str;

                    objHttp.onreadystatechange = stateChanged;
                    objHttp.open("GET",url,true);
                    objHttp.send(null);
                }
            }
            function showCity(str)
            {
                if(str=="-2"){
                    document.getElementById("divCity").innerHTML='<select id="ddlCity" name="ddlCity"><option value="-2" >Select</option></select>'
                }else{
                
                    i=2;
                    getXMLHttpRequest();
                    var url="getCity.jsp";
                    url=url+"?q="+str;
                    objHttp.onreadystatechange = stateChanged;
                    objHttp.open("GET",url,true);
                    objHttp.send(null);
                }
            }

            function stateChanged()
            {
                if (objHttp.readyState==4)
                {
                    if(i==1) {
                        document.getElementById("divState").innerHTML=objHttp.responseText
                        document.getElementById("divCity").innerHTML='<select id="ddlCity" name="ddlCity"><option value="Select" >Select</option></select>';
                    }
                    else if(i==2){document.getElementById("divCity").innerHTML=objHttp.responseText;
                    }                  
                }
            }


        </script>
        <script language="JavaScript">
            $(function() {
               
                $("#txtDOB").datepicker();
                $('#txtDOB').datepicker('option',
                {
                    dateFormat : 'yy-mm-dd' ,
                    maxDate:0,
                    minDate:-70000,
                    changeMonth:true,
                    changeYear:true
                }
            );
                $("#txtDOJ").datepicker();
                $('#txtDOJ').datepicker('option',
                {
                    dateFormat : 'yy-mm-dd' ,
                    maxDate:0,
                    minDate:-70000,
                    changeMonth:true,
                    changeYear:true
                }
            );
            });
        </script>
        <script type="text/javascript">
            function ValidateAddExpertForm()
            {
                var strUsername = document.getElementById("txtUserName").value;
                if(isEmpty(strUsername))
                {
                    alert("Username Field can not be Empty ");
                    document.getElementById("txtUserName").focus();
                    return false;
                }
                else{
                    if(hasSpace(strUsername))
                    {
                        alert("Username must not have Spaces");
                        document.getElementById("txtUserName").value="";
                        document.getElementById("txtUserName").focus();
                        return false;
                    }
                    if(isAlphaNumeric(strUsername)==false)
                    {
                        alert("Username must have Alphanumeric characters only");
                        document.getElementById("txtUserName").value="";
                        document.getElementById("txtUserName").focus();
                        return false;
                    }
                    if(isNumeric(strUsername.charAt(0))){
                        alert("Username must start with Alphabet");
                        document.getElementById("txtUserName").value="";
                        document.getElementById("txtUserName").focus();
                        return false;
                    }

                    if(isInRange(6,20,strUsername)==false){
                        alert("Length of Username must be between 6-20");
                        document.getElementById("txtUserName").value="";
                        document.getElementById("txtUserName").focus();
                        return false;
                    }
                }

                var   strPassword=document.getElementById("txtPassword").value;
                if(isEmpty(strPassword)==true){ 
                    alert("Password is required");
                    document.getElementById("txtPassword").focus();
                    return false;
                }
               
                var   strConfirmPassword=document.getElementById("txtConfirmPassword").value;
                if(strPassword!=strConfirmPassword){
                    alert("Confirm Password must match Password");
                    document.getElementById("txtConfirmPassword").value="";
                    document.getElementById("txtConfirmPassword").focus();
                    return false;
                }
              
                
                var strName = document.getElementById("txtName").value;
                if(isEmpty(strName))
                {
                    alert("Name Field cannot be Empty");
                    document.getElementById("txtName").focus();
                    return false;
                }
                if(isName(strName)==false)
                {
                    alert("Must enter valid name");
                    document.getElementById("txtName").value="";
                    document.getElementById("txtName").focus();
                    return false;
                }
                
                var strDOB = document.getElementById("txtDOB").value;
                if(isEmpty(strDOB))
                {
                    alert("Enter Date of Birth");
                    document.getElementById("txtDOB").focus();
                    return false;
                }
                if(isFutureDate(strDOB))
                {
                    alert("Date of Birth can not be in Future");
                    document.getElementById("txtDOB").value="";
                    document.getElementById("txtDOB").focus();
                    return false;
                }
                if((document.getElementById("rbMale").checked==false)&&(document.getElementById("rbFemale").checked==false))
                {
                    alert("Must select Gender");
                    document.getElementById("rbMale").focus();
                    return false;
                }
                var taAddress=document.getElementById("taAddress").value;
                if(taAddress==""){
                    alert("Must enter address");
                    document.getElementById("taAddress").focus();
                    return false;
                }
                var ddlCountry=document.getElementById("ddlCountry").value;
                if(ddlCountry=="-2"){
                    alert("Must select country");
                    document.getElementById("ddlCountry").focus();
                    return false;
                }
                var ddlState=document.getElementById("ddlState").value;
                if(ddlState=="-2"){
                    alert("Must select state");
                    document.getElementById("ddlState").focus();
                    return false;
                }
                var ddlCity=document.getElementById("ddlCity").value;
                if(ddlCity=="-2"){
                    alert("Must select city");
                    document.getElementById("ddlCity").focus();
                    return false;
                }
                
                var strPhone= document.getElementById("txtPhone").value;
                var strMobile= document.getElementById("txtMobile").value;
                if(isEmpty(strPhone)&&isEmpty(strMobile))
                {
                    alert("Enter Phone number or Mobile number");
                    document.getElementById("txtPhone").focus();
                    return false;
                }
                else
                {
                    if(isEmpty(strPhone)==false)
                    {
                        if(isNumeric(strPhone)==false)  
                        {
                            alert("Invalid Phone Number");
                    
                            return false;
                        }
                        if(isInRange(10, 15, strPhone)==false)
                        {
                            alert("Length of Phone Number must be between 10 to 14")
                            return false;
                        }
                    }
                    if(isEmpty(strMobile)==false)
                    {
                        if(isNumeric(strMobile)==false)  
                        {
                            alert("Invalid Mobile Number");
                    
                            return false;
                        }
                        if(isInRange(10, 15, strMobile)==false)
                        {
                            alert("Length of Mobile Number must be between 10 to 14")
                            return false;
                        }
                    }
                }
                var   strEmailID=document.getElementById("txtEmailID").value;
                if(isEmpty(strEmailID)==true){ 
                    alert("Email id is required");
                    document.getElementById("txtEmailID").focus();
                    return false;
                }
                if(isEmail(strEmailID)==false)
                {
                    alert("Invalid Email Id");
                    document.getElementById("txtEmailID").focus();
                    return false;
                }
                var   strDepartment=document.getElementById("txtDepartment").value;
                if(isEmpty(strDepartment)==true){ 
                    alert("Enter name of Department");
                    document.getElementById("txtDepartment").focus();
                    return false;
                }
                var strDesignation=document.getElementById("txtDesignation").value;
                if(isEmpty(strDesignation)==true){ 
                    alert("Enter Designation");
                    document.getElementById("txtDesignation").focus();
                    return false;
                }
                var strDOJ = document.getElementById("txtDOJ").value;
                if(isEmpty(strDOJ))
                {
                    alert("Enter Date of Joining");
                    document.getElementById("txtDOJ").focus();
                    return false;
                }
                if(isFutureDate(strDOJ))
                {
                    alert("Date of Joining can not be in Future");
                    document.getElementById("txtDOJ").value="";
                    document.getElementById("txtDOJ").focus();
                    return false;
                }
                
                return true;
            }
        </script>
    </head>
    <body style="padding: 0 0 0 0; margin: 0 0 0 0;">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color: #eaece0;">
            <tr>
                <td>
                    <div style="width: 100%; height: 5px; background-color: #3a477a">
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-image: url(../images/header-gradient.png); background-position: left center;
                    background-repeat: repeat-x;">
                    <jsp:include page="header.jsp"/>
                </td>
            </tr>


            <tr>
                <td>
                    <div style="background: #dde7fa; background-repeat: repeat-x; background-position: center center;
                         height: 50px;">

                        <div style="width: 100%; height: 5px; background-color: #3a477a">
                        </div>
                        <div style="width: 980px; height: 20px; margin: 0 auto;">
                            <jsp:include page="topmenu.jsp" />
                        </div>

                    </div>
                    <div style="width: 100%; height: 5px; background-color: #3a477a">
                    </div>
                </td>
            </tr>


            <tr>
                <td style="background-color: #fff;">
                    <!--Middle-->
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 980px; height: 350px;
                           min-height: 350px; margin: 0 auto; border-left: solid 1px #eeeeee; border-right: solid 1px #eeeeee;">
                        <tr>
                            <td>
                                <jsp:include page="AddExpert.jsp"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <jsp:include page="footer.jsp"/>
                </td>
            </tr>
        </table>
    </body>
</html>

