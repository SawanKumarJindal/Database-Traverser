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
            function check()
            {
                
                var name=document.getElementById("txtUsername").value;
                var password=document.getElementById("txtCPassword").value;
                var npassword=document.getElementById("txtNPassword").value;
                var cpassword=document.getElementById("txtCNPassword").value;
                var msg = document.getElementById("lblMessage");
                var empnp = isEmpty(npassword);
                 var empcp = isEmpty(cpassword)
                var empu=isEmpty(name);
                var spaceu = hasSpace(name);
                var empp=isEmpty(password);
                var spacep=hasSpace(password);
                var cpass = samePassword(npassword,cpassword);
               
                if(empu==true)
                    {
                        
                        document.getElementById("txtUsername").focus();
                        
                        msg.innerHTML="Enter UserName";
                        return false;
                    } 
                   
                    if(spaceu==true)
                    {
                        
                        document.getElementById("txtUsername").focus();
                        msg.innerHTML="Space Cannot be Entered";
                        return false;
                    }
                    if(empp==true)
                    {
                        
                        document.getElementById("txtCPassword").focus();
                        msg.innerHTML="Enter Password";
                        return false;
                    }
                    if(spacep==true)
                    {
                        
                        document.getElementById("txtCPassword").focus();
                        msg.innerHTML="Space Cannot be Entered in Password";
                        return false;
                    }
                     if(empnp==true)
                    {
                        
                        document.getElementById("txtNPassword").focus();
                        
                        msg.innerHTML="Enter New Password";
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
                        msg.innerHTML="Passwords Dont's Match";
                        return false;  
                            
                        }
                    else{    
                         msg.innerHTML="";
                         return true;
                    }
                    
                   
                    
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
                                <jsp:include page="ChangePassword.jsp"/>
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

