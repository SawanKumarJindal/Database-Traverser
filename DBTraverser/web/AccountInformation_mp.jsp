<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DBTraverser</title>
        <jsp:include page="stylesheet.jsp"/>
         <script type="text/javascript" src="validations.js"></script>
        <script type="text/javascript">
            function check()
            {
                var name = document.getElementById("txtUsername").value;
                var msg = document.getElementById("lblMessage");

                var empu = isEmpty(name);
                var spaceu = hasSpace(name);
                var rangeu = isInRange(6, 20, name);
                
                var npassword=document.getElementById("txtPassword").value;
                var cpassword=document.getElementById("txtCNPassword").value;
               
                var empcp = isEmpty(cpassword);
                var empp=isEmpty(npassword);
                var spacep=hasSpace(npassword);
                var rangep= isInRange(6, 20, npassword)
                var cpass = samePassword(npassword,cpassword);
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
                //alert("");
                if(empu==true)
                {
                    document.getElementById("txtUsername").focus();
                    msg.innerHTML="Enter Username";
                    return false;
                }
                    
               
                else if(spaceu==true)
                {
                    document.getElementById("txtUsername").focus();
                    msg.innerHTML="no space allowed";
                    return false;
                }
                    
                else if(rangeu==false)
                {
                    document.getElementById("txtUsername").focus();
                    msg.innerHTML="username should be between 6-20 characters";
                    return false;
                            
                }
                if(empp==true)
                {
                        
                    document.getElementById("txtPassword").focus();
                    msg.innerHTML="Enter Password";
                    return false;
                }
                if(rangep==false)
                {
                    document.getElementById("txtPassword").focus();
                    msg.innerHTML="Password should be between 6-20 characters";
                    return false;
                            
                }
                if(spacep==true)
                {
                        
                    document.getElementById("txtPassword").focus();
                    msg.innerHTML="Space Cannot be Entered in Password";
                    return false;
                }
                     
                if(empcp==true)
                {
                        
                    document.getElementById("txtCNPassword").focus();
                        
                    msg.innerHTML="Enter Confirm Password";
                    return false;
                }
                if(cpass==false)
                {
                    document.getElementById("txtUsername").focus();
                    msg.innerHTML="Passwords Don't Match";
                    return false;  
                            
                }
                  
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

                    var url="module/getState.jsp";
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
                    var url="module/getCity.jsp";
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
               
                $("#txtBirth").datepicker();
                $('#txtBirth').datepicker('option',
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
                <td style="background-image: url(images/header-gradient.png); background-position: left center;
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
                                <jsp:include page="AccountInformation.jsp"/>
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

